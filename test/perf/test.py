#!/usr/bin/python3.10
"""
Run a series of space and time complexity test on a synthetic gpu code instrumented by scabbard.
Then produce a graph and table of the data.
Each test in the series will have a different number of read and write points of interest to
    the scabbard instrumenter, and it is the relationship between the two that we wish to see,
    as well as the comparison between the uninstrumented versions runtime.
"""

import sys, os, subprocess
from pathlib import Path
from typing import List, Type, NewType, NamedTuple, Iterable
from dataclasses import dataclass, field
from time import time_ns
from pint import UnitRegistry, Quantity, Unit
from colors import *

RUN_X_SCRIPT: Path = Path("./test/run_x.sh")
HIPCC: Path|None = None
SCABBARD: Path|None = None

TimeData: Type = NewType("TimeData", Quantity)
SpaceData: Type = NewType("SpaceData", Quantity)
UREG: UnitRegistry = UnitRegistry()

class dim3(NamedTuple):
    x:int
    y:int
    z:int

@dataclass
class TestConfig:
    src: Path
    cpu_read_mod: int
    gpu_write_mod: int
    is_instrumented: bool = field(default=True)
    data_size: int = field(default=1024)
    def gen_extra_args(self) -> str:
        return (f"-DCPU_READ_MOD={self.cpu_read_mod}"
                f"-DGPU_WRITE_MOD={self.gpu_write_mod}"
                f"-DDATA_SIZE={self.data_size}")

@dataclass
class TestResult(TestConfig):
    runtime: TimeData
    verif_time: TimeData|None = field(default=None)
    trace_size: SpaceData|None = field(default=None)
    @staticmethod
    def create(config:TestConfig, runtime_:TimeData,
               verif_time_:TimeData|None = None, 
               trace_size_:SpaceData|None = None) -> 'TestResult':
        """
        Create the TestResult using a TestConfig and the result data, rather than having to 
        break down the TestConfig part every time you want to create a TestResult 

        Args:
            config (TestConfig): the config data
            runtime_ (TimeData): the runtime data
            verif_time (TimeData): the runtime of the verif tool on the data
            trace_size_ (SpaceData|None): the size of the trace file (optional if config.is_instrumented == False)

        Returns:
            TestResult: The test results and config data for the test bundled into one
        """
        return TestResult(config.src, 
                          config.cpu_read_mod, 
                          config.gpu_write_mod, 
                          config.is_instrumented, 
                          runtime_, verif_time_,
                          trace_size_)
        
def remove_files(*files: List[Path]) -> None:
    """
    Remove all of the files provided.
    """
    for file in files:
        if file.exists():
            os.remove(file)


def run_uninstrumented(config: TestConfig) -> TestResult:
    """
    Build and run a non-instrumented version of the synthetic test,
    time it, and return the results.

    Args:
        config (TestConfig): Test configuration data

    Returns:
        TestResult: The results of the test
    """
    exe: Path = config.src.stem
    try:
        # build the exe
        try:
            subprocess.run(f"{HIPCC} {config.gen_extra_args()} -std=c++17 -x hip -g -O2 -o {exe} {config.src}",
                        shell=True, check=True)
        except subprocess.CalledProcessError as cpe:
            prRed(f"Failed to BUILD NON-instrumented for test: {config}")
            prRed(str(cpe.stderr) if cpe.stderr is not None else str(cpe.stdout))
            raise cpe
        except Exception as ex:
            prRed(f"Failed to BUILD NON-instrumented for test: {config}")
            raise ex
        # run the test
        start: int = time_ns()
        try:
            subprocess.run(f"{exe}",shell=True, check=True)
            stop: int = time_ns()
        except subprocess.CalledProcessError as cpe:
            prRed(f"Failed to RUN NON-instrumented exe for test: {config}")
            prRed(str(cpe.stderr) if cpe.stderr is not None else str(cpe.stdout))
            raise cpe
        except Exception as ex:
            prRed(f"Failed to RUN NON-instrumented exe for test: {config}")
            raise ex
        # return the results
        return TestResult.create(config,(stop-start)*UREG.ns)
    except Exception as ex:
        raise ex
    finally:
        remove_files(exe)


def run_uninstrumented(config: TestConfig) -> TestResult:
    """
    Build and run a non-instrumented version of the synthetic test,
    time it, get the size of the trace file, and return the results.

    Args:
        config (TestConfig): Test configuration data

    Returns:
        TestResult: The results of the test
    """
    # get relevant file names
    base: Path = config.src.stem
    exe: Path = config.src.with_suffix(".instr")
    meta: Path = config.src.with_suffix(".scabbard.meta")
    trace: Path = config.src.with_suffix(".scabbard.trace")
    try:
        # build instrumented executable
        try:
            subprocess.run(f"{SCABBARD} instr --meta-file={meta} {HIPCC} {config.gen_extra_args()} -std=c++17 -x hip -g -O2 -o {exe} {config.src}",
                        shell=True, check=True)
        except subprocess.CalledProcessError as cpe:
            prRed(f"Failed to BUILD instrumented exe for test: {config}")
            prRed(str(cpe.stderr) if cpe.stderr is not None else str(cpe.stdout))
            raise cpe
        except Exception as ex:
            prRed(f"Failed to BUILD instrumented exe for test: {config}")
            raise ex
        # run test
        start: int = time_ns()
        try:
            subprocess.run(f"{SCABBARD} trace --trace-file={trace} {exe}", shell=True, check=True)
            stop: int = time_ns()
        except subprocess.CalledProcessError as cpe:
            prRed(f"Failed to RUN instrumented exe for test: {config}")
            prRed(str(cpe.stderr) if cpe.stderr is not None else str(cpe.stdout))
            raise cpe
        except Exception as ex:
            prRed(f"Failed to RUN instrumented exe for test: {config}")
            raise ex

        # determine trace size
        trace_size: Quantity = os.path.getsize(trace) * UREG.Bytes
        # time verif
        verif_start: int = time_ns()
        try:
            subprocess.run(f"{SCABBARD} verif {meta} {trace}", shell=True, check=True)
            verif_stop: int = time_ns()
        except subprocess.CalledProcessError as cpe:
            prRed(f"Failed to RUN instrumented exe for test: {config}")
            prRed(str(cpe.stderr) if cpe.stderr is not None else str(cpe.stdout))
            raise cpe
        except Exception as ex:
            prRed(f"Failed to RUN instrumented exe for test: {config}")
            raise ex
        #clean up
        remove_files(trace)
        # return the data
        return TestResult.create(config,
                                (stop-start)*UREG.ns,
                                (verif_stop-verif_start)*UREG.ns,
                                trace_size)
    except Exception as ex:
        raise ex
    finally:
        remove_files(exe,meta,trace)
        
        
        
def run_tests(src:Path, rw_mods: Iterable[int], 
              data_size: int=1024, do_instr: bool=True) -> List[TestResult]:
    """
    Run all of the tests and collect the test results in a list to return.

    Args:
        src (Path): path to the source file to use for the test.
        rw_mods (Iterable[int]): a list of all modifiers to haw many times reads vs writes happens.
        data_size (int, optional): the size of the internal data array (max 1024). Defaults to 1024.
        do_no_instrs (bool, optional): if the tests should use scabbard and ne instrumented or not. Defaults to True.

    Returns:
        List[TestResult]: a list of all of the data results generated.
    """
    data: List[TestResult] = list()
    for cpu in rw_mods:
        for gpu in rw_mods:
            config: TestConfig = TestConfig(src, cpu, gpu, do_instr, data_size)
                data.append(run_instrumented(config)
                            if do_instr else run_uninstrumented(config))
    return data

def output_data(data:List[TestResult]) -> None:
    """
    generate console and/or graph output (TBD)

    Args:
        data (List[TestResult]): The data to output
    """
    #TODO
    pass
        
    
def check_environ() -> None:
    """
    Check the environment variables to make sure rocm and 
    all other required variables are defined.
    Otherwise raise Error.
    """
    if 'ROCM_PATH' not in os.environ:
        raise RuntimeError("`ROCM_PATH` was not defined in your environment.")
    tmp: Path = Path(os.environ['ROCM_PATH'])
    if not (tmp.exists() and tmp.is_dir()):
        raise RuntimeError("`ROCM_PATH` was not defined in your environment.")
    if not HIPCC.exists():
        raise RuntimeError("`$ROCM_PATH/bin/hipcc` could not be found.")
    if 'SCABBARD_PATH' not in os.environ:
        tmp = Path(f"{os.curdir}/build/scabbard")
        if tmp.exists() and tmp.is_dir():
            os.environ.update({'SCABBARD_PATH': str(tmp)})
        else:
            raise RuntimeError("`SCABBARD_PATH` was not defined in your environment.")
    tmp = Path(os.environ['SCABBARD_PATH'])
    if not (tmp.exists() and tmp.is_dir()):
        raise RuntimeError("`SCABBARD_PATH` was not defined in your environment.")


def main(args: List[str]) -> None:
    """
    Run the tests as called from the command line

    Args:
        args (List[str]): commandline args
    """
    try:
        if not RUN_X_SCRIPT.exists():
            raise RuntimeError("Could not find the `run_x.sh` script."+
                               "Please ensure your running this from the top level of the scabbard repo.")
        #TODO: initiate tests
    except Exception as ex:
        prRed(ex)
    print("\n==== END OF TESTS ====\n")

if __name__ == "__main__":
    check_environ()
    HIPCC = Path(os.environ['ROCM_PATH']+"/bin/hipcc")
    SCABBARD = Path(os.environ['SCABBARD_PATH']+"/scabbard.py")
    main(sys.argv)
