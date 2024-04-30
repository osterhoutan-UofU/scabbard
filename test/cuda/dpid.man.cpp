/**
 * @file dpid.cpp
 * @brief a version of https://github.com/mergian/dpid converted to hip for testing purposes
 * 				it performs a form of image downcasing on the GPU. 
 * 				This version has been modified to work with scabbard in manual instrumentation mode.
 * 				Has a modified main function to modify it to be fit for testing
 * @date 2024-04-30
 * 
 */

// Copyright (c) 2016 Nicolas Weber and Sandra C. Amend / GCC / TU-Darmstadt. All rights reserved. 
// Use of this source code is governed by the BSD 3-Clause license that can be
// found in the LICENSE file.

#define _USE_MATH_DEFINES 
#include <math.h>
#include <iostream>
#include <cstdint>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#include <hip/hip_vector_types.h>
// #include <hip/vector_functions.h>

#include <scabbard/trace/calls.hpp>
#include <src/device-defs.cpp>

#define THREADS 128
#define WSIZE 32
#define TSIZE (THREADS / WSIZE)

#define TX threadIdx.x
#define PX (blockIdx.x * TSIZE + (TX / WSIZE))
#define PY blockIdx.y

#define WTHREAD	(TX % WSIZE)
#define WARP	(TX / WSIZE)

using namespace scabbard;

//-------------------------------------------------------------------
// SHARED
//-------------------------------------------------------------------
struct Params {
	uint32_t oWidth;
	uint32_t oHeight;
	uint32_t iWidth;
	uint32_t iHeight;
	float pWidth;
	float pHeight;
	float lambda;
};

__managed__ size_t src_id = 0ul;

//-------------------------------------------------------------------
// DEVICE
//-------------------------------------------------------------------
__device__ __forceinline__ void normalize(float4& var, void* DT) {
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(var.x),
			&src_id, 62u, 3u
		);
	var.x /= var.w;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(var.y),
			&src_id, 70u, 3u
		);
	var.y /= var.w;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(var.z),
			&src_id, 76u, 3u
		);
	var.z /= var.w;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(var.w),
			&src_id, 82u, 3u
		);
	var.w = 1.0f;
}

//-------------------------------------------------------------------
__device__ __forceinline__ void add(float4& output, const uchar3& color, const float factor, void* DT) {
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.x),
			&src_id, 92u, 3u
		);	
	output.x += color.x * factor;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.y),
			&src_id, 98u, 3u
		);
	output.y += color.y * factor;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.z),
			&src_id, 104u, 3u
		);
	output.z += color.z * factor;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.w),
			&src_id, 110u, 3u
		);
	output.w += factor;
}

//-------------------------------------------------------------------
__device__ __forceinline__ void add(float4& output, const float4& color, void* DT) {
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.x),
			&src_id, 120u, 3u
		);
	output.x += color.x;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.y),
			&src_id, 126u, 3u
		);
	output.y += color.y;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.z),
			&src_id, 132u, 3u
		);
	output.z += color.z;
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(output.w),
			&src_id, 138u, 3u
		);
	output.w += color.w;
}

//-------------------------------------------------------------------
__device__ __forceinline__ float lambda(const Params p, const float dist, void* DT) {
	if(p.lambda == 0.0f)
		return 1.0f;
	else if(p.lambda == 1.0f)
		return dist;

	return pow(dist, p.lambda);
}

//-------------------------------------------------------------------
__device__ __forceinline__ void operator+=(float4& output, const float4 value) {
	// scabbard::trace::device::trace_append$mem(DT,
	// 		(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
	// 		&(output.x),
	// 		&src_id, 158u, 3u
	// 	);
	output.x += value.x;
	// scabbard::trace::device::trace_append$mem(DT,
	// 		(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
	// 		&(output.y),
	// 		&src_id, 162u, 3u
	// 	);
	output.y += value.y;
	// scabbard::trace::device::trace_append$mem(DT,
	// 		(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
	// 		&(output.z),
	// 		&src_id, 170u, 3u
	// 	);
	output.z += value.z;
	// scabbard::trace::device::trace_append$mem(DT,
	// 		(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
	// 		&(output.w),
	// 		&src_id, 176u, 3u
	// 	);
	output.w += value.w;
}

//-------------------------------------------------------------------
struct Local {
	float sx, ex, sy, ey;
	uint32_t sxr, syr, exr, eyr, xCount, yCount, pixelCount;

	__device__ __forceinline__ Local(const Params& p) {
		sx			= fmaxf(PX		* p.pWidth, 0.0f);
		ex			= fminf((PX+1)	* p.pWidth, p.iWidth);
		sy			= fmaxf(PY		* p.pHeight, 0.0f);
		ey			= fminf((PY+1)	* p.pHeight, p.iHeight);

		sxr			= (uint32_t)floor(sx);
		syr			= (uint32_t)floor(sy);
		exr			= (uint32_t)ceil(ex);
		eyr			= (uint32_t)ceil(ey);
		xCount		= exr - sxr;
		yCount		= eyr - syr;
		pixelCount	= xCount * yCount;
	}
};

//-------------------------------------------------------------------
__device__ __forceinline__ float contribution(const Local& l, float f, const uint32_t x, const uint32_t y, void* DT) {
	if(x < l.sx)		f *= 1.0f - (l.sx - x);
	if((x+1.0f) > l.ex)	f *= 1.0f - ((x+1.0f) - l.ex);
	if(y < l.sy)		f *= 1.0f - (l.sy - y);
	if((y+1.0f) > l.ey)	f *= 1.0f - ((y+1.0f) - l.ey);
	return f;
}

//-------------------------------------------------------------------
// taken from: https://devblogs.nvidia.com/parallelforall/faster-parallel-reductions-kepler/
__device__ __forceinline__ float4 __shfl_down(const float4 var, const uint32_t srcLane, void* DT, const uint32_t width = 32) {
	float4 output;
	output.x = __shfl_down(var.x, srcLane, width);
	output.y = __shfl_down(var.y, srcLane, width);
	output.z = __shfl_down(var.z, srcLane, width);
	output.w = __shfl_down(var.w, srcLane, width);
	return output;
}

//-------------------------------------------------------------------
__device__ __forceinline__ void reduce(float4& value, void* DT) {
	float4 tmp;
	tmp = __shfl_down(value, 16, DT);
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(value),
			&src_id, 229u, 3u
		);
	value +=  tmp;
	tmp = __shfl_down(value, 8, DT);
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(value),
			&src_id, 236u, 3u
		);
	value +=  tmp;
	tmp = __shfl_down(value, 4, DT);
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(value),
			&src_id, 243u, 3u
		);
	value +=  tmp;
	tmp = __shfl_down(value, 2, DT);
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(value),
			&src_id, 248u, 3u
		);
	value +=  tmp;
	tmp = __shfl_down(value, 1, DT);
	scabbard::trace::device::trace_append$mem(DT,
			(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
			&(value),
			&src_id, 255u, 3u
		);
	value +=  tmp;
}

//-------------------------------------------------------------------
__device__ __forceinline__ float distance(const float4& avg, const uchar3& color, void* DT) {
	const float x = avg.x - color.x;
	const float y = avg.y - color.y;
	const float z = avg.z - color.z;

	return sqrt(x * x + y * y + z * z) / 441.6729559f; // L2-Norm / sqrt(255^2 * 3)
}

//-------------------------------------------------------------------
__global__ void kernelGuidance(const uchar3* __restrict__ input, uchar3* __restrict__ patches, const Params p, void* DT) {
    if(PX >= p.oWidth || PY >= p.oHeight) return;

	// init
	const Local l(p);
	float4 color = {0.0f, 0.0f, 0.0f, 0.0f};

	// iterate pixels
	for(uint32_t i = WTHREAD; i < l.pixelCount; i += WSIZE) {
		const uint32_t x = l.sxr + (i % l.xCount);
		const uint32_t y = l.syr + (i / l.xCount);
		 
		float f = contribution(l, 1.0f, x, y, DT);	

		const uchar3& pixel = input[x + y * p.iWidth];
		add(color, make_float4(pixel.x * f, pixel.y * f, pixel.z * f, f), DT);
	}

	// reduce warps
	reduce(color, DT);

	// store results
	if((TX % 32) == 0) {
		normalize(color, DT);
		uchar3 tmp_val = make_uchar3(color.x, color.y, color.z);
		uchar3& tmp_ref = patches[PX + PY * p.oWidth];
		scabbard::trace::device::trace_append$mem(DT,
				(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
				&(tmp_ref),
				&src_id, 301u, 5u
			);
		tmp_ref = tmp_val;
	}
}

//-------------------------------------------------------------------
__device__ __forceinline__ float4 calcAverage(const Params& p, const uchar3* __restrict__ patches, void* DT) {
	const float corner	= 1.0;
	const float edge	= 2.0;
	const float center	= 4.0;

	// calculate average color
	float4 avg = {0.0f, 0.0f, 0.0f, 0.0f};

	// TOP
	if(PY > 0) {
		if(PX > 0) 
			add(avg, patches[(PX - 1) + (PY - 1) * p.oWidth], corner, DT);

		add(avg, patches[(PX) + (PY - 1) * p.oWidth], edge, DT);
	
		if((PX+1) < p.oWidth)
			add(avg, patches[(PX + 1) + (PY - 1) * p.oWidth], corner, DT);
	}

	// LEFT
	if(PX > 0) 
		add(avg, patches[(PX - 1) + (PY) * p.oWidth], edge, DT);

	// CENTER
	add(avg, patches[(PX) + (PY) * p.oWidth], center, DT);
	
	// RIGHT
	if((PX+1) < p.oWidth)
		add(avg, patches[(PX + 1) + (PY) * p.oWidth], edge, DT);

	// BOTTOM
	if((PY+1) < p.oHeight) {
		if(PX > 0) 
			add(avg, patches[(PX - 1) + (PY + 1) * p.oWidth], corner, DT);

		add(avg, patches[(PX) + (PY + 1) * p.oWidth], edge, DT);
	
		if((PX+1) < p.oWidth)
			add(avg, patches[(PX + 1) + (PY + 1) * p.oWidth], corner, DT);
	}

	normalize(avg, DT);

	return avg;
}

//-------------------------------------------------------------------
__global__ void kernelDownsampling(const uchar3* __restrict__ input, const uchar3* __restrict__ patches, const Params p, uchar3* __restrict__ output, void* DT) {
    if(PX >= p.oWidth || PY >= p.oHeight) return;

	// init
	const Local l(p);
	const float4 avg = calcAverage(p, patches, DT);

	float4 color = {0.0f, 0.0f, 0.0f, 0.0f};

	// iterate pixels
	for(uint32_t i = WTHREAD; i < l.pixelCount; i += WSIZE) {
		const uint32_t x = l.sxr + (i % l.xCount);
		const uint32_t y = l.syr + (i / l.xCount);

		const uchar3& pixel = input[x + y * p.iWidth];
		float f = distance(avg, pixel, DT);
		
		f = lambda(p, f, DT);
		f = contribution(l, f, x, y, DT);

		add(color, pixel, f, DT);
	}

	// reduce warp
	reduce(color, DT);

	if(WTHREAD == 0) {
		uchar3& ref = output[PX + PY * p.oWidth];
		uchar3 val;

		if(color.w == 0.0f)
			val = make_uchar3((unsigned char)avg.x, (unsigned char)avg.y, (unsigned char)avg.z);
		else {
			normalize(color, DT);
			val = make_uchar3((unsigned char)color.x, (unsigned char)color.y, (unsigned char)color.z);
		}
		scabbard::trace::device::trace_append$mem(DT,
				(InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::UNKNOWN_HEAP),
				&(ref),
				&src_id, 394u, 5u
			);
		ref = val;
	}
}

//-------------------------------------------------------------------
// HOST
//-------------------------------------------------------------------
void check(hipError_t err) {
	if(err != hipSuccess) {
		std::cerr << "CUDA_ERROR: " << (int)err << " " << hipGetErrorName(err) << ": " << hipGetErrorString(err) << std::endl;
		exit(1);
	}
}

//-------------------------------------------------------------------
void run(const Params& i, const void* hInput, void* hOutput) {
	// calc sizes
	const size_t sInput		= sizeof(uchar3) * i.iWidth * i.iHeight;
	const size_t sOutput	= sizeof(uchar3) * i.oWidth * i.oHeight;
	const size_t sGuidance	= sizeof(uchar3) * i.oWidth * i.oHeight;

	// alloc GPU
	uchar3* dInput = 0, *dOutput = 0, *dGuidance = 0;
	
	check(hipMalloc(&dInput, sInput));
	scabbard::trace::host::trace_append$alloc(
			(InstrData)(InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP),
			dInput,
			&src_id, 418u, 9u,
			sInput
		);
	check(hipMalloc(&dOutput, sOutput));
	scabbard::trace::host::trace_append$alloc(
			(InstrData)(InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP),
			dOutput,
			&src_id, 418u, 9u,
			sOutput
		);
	check(hipMalloc(&dGuidance, sGuidance));
	scabbard::trace::host::trace_append$alloc(
			(InstrData)(InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP),
			dGuidance,
			&src_id, 432u, 9u,
			sGuidance
		);

	// copy data
	check(hipMemcpy(dInput, hInput, sInput, hipMemcpyHostToDevice));
	scabbard::trace::host::trace_append$mem(
			(InstrData)(InstrData::SYNC_EVENT | InstrData::ON_HOST),
			0ul,
			&src_id, 441u, 9u
		);

	// launch config
	const dim3 threads(THREADS, 1, 1); // 4 warps, 1 warp per patch
	const dim3 blocks((uint32_t)std::ceil(i.oWidth / (double)TSIZE), i.oHeight, 1);
	
	// execute kernels
	void* DT1 = scabbard::trace::register_job(0ul);
	kernelGuidance		<<<blocks, threads>>>(dInput, dGuidance, i, DT1);
	scabbard::trace::register_job_callback(DT1, 0ul);
	void* DT2 = scabbard::trace::register_job(0ul);
	kernelDownsampling	<<<blocks, threads>>>(dInput, dGuidance, i, dOutput, DT2);
	scabbard::trace::register_job_callback(DT2, 0ul);


	// copy data
	check(hipMemcpy(hOutput, dOutput, sOutput, hipMemcpyDeviceToHost));
	scabbard::trace::host::trace_append$mem(
			(InstrData)(InstrData::SYNC_EVENT | InstrData::ON_HOST),
			0ul,
			&src_id, 462u, 9u
		);
	scabbard::trace::host::trace_append$alloc(
			(InstrData)(InstrData::READ | InstrData::ON_HOST | InstrData::DEVICE_HEAP),
			dOutput,
			&src_id, 462u, 9u,
			sOutput
		);

	// free GPU
	check(hipFree(dInput));
	scabbard::trace::host::trace_append$mem(
			(InstrData)(InstrData::SYNC_EVENT | InstrData::ON_HOST),
			0ul,
			&src_id, 476u, 9u
		);
	check(hipFree(dOutput));
	scabbard::trace::host::trace_append$mem(
			(InstrData)(InstrData::SYNC_EVENT | InstrData::ON_HOST),
			0ul,
			&src_id, 482u, 9u
		);
	check(hipFree(dGuidance));
	scabbard::trace::host::trace_append$mem(
			(InstrData)(InstrData::SYNC_EVENT | InstrData::ON_HOST),
			0ul,
			&src_id, 488u, 9u
		);
	
	// reset device
	//check(hipDeviceReset());
}

#define IW (4096u)
#define IH (8192u)
#define OW (1024u)
#define OH (2048u)
#define PW ((float)(IW/((float)OW)))
#define PH ((float)(IH/((float)OH)))
#define LAMBDA (16.0f)
#define I_SIZE (IH * IW)
#define O_SIZE (OH * OW)

auto main() -> int {
	src_id = scabbard::trace::metadata_register$src("test/cuda/dpid.man.cpp");
	scabbard::trace::scabbard_init();

	Params i = {
							OW, OH, 
							IW, IH, 
							PW, PH,
							LAMBDA
						};
	const size_t sInput		= sizeof(uchar3) * i.iWidth * i.iHeight;
	const size_t sOutput	= sizeof(uchar3) * i.oWidth * i.oHeight;

	uchar3 hInput[I_SIZE], hOutput[O_SIZE];

	run(i, hInput, hOutput);
	
	return EXIT_SUCCESS;
}
