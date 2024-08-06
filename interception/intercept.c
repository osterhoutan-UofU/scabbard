/**
 * @file intercept.c
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief derived from https://github.com/LLNL/SCABBARD/blob/e6c9ece1356c93418a04452f98f0f55497f4bf4d/interception/intercept.c
 *        used to implement the LD_PRELOAD trick for getting the scabbard instrumenter working.
 * @date 2024-05-23
 * 
 */

#define _GNU_SOURCE
#include <unistd.h>
#include <dlfcn.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

typedef ssize_t (*execve_func_t)  (const char* filename, char* const argv[], char* const envp[]);
typedef ssize_t (*execv_func_t)   (const char* path, char* const argv[]);
typedef ssize_t (*execvp_func_t)  (const char* file, char* const argv[]);
typedef ssize_t (*execvpe_func_t) (const char *file, char *const argv[], char *const envp[]);

/* Function pointers for unused exec system calls */
//typedef ssize_t (*execl_func_t)   (const char* path, const char *arg, ...);
//typedef ssize_t (*execlp_func_t)  (const char* file, const char *arg, ...);
//typedef ssize_t (*execle_func_t)  (const char *path, const char *arg, ..., char * const envp[]);

static execve_func_t    old_execve = NULL;
static execv_func_t     old_execv = NULL;
static execvp_func_t    old_execvp = NULL;
static execvpe_func_t   old_execvpe = NULL;

/* Unused globals */
//static execl_func_t     old_execl = NULL;
//static execlp_func_t    old_execlp = NULL;
//static execle_func_t    old_execle = NULL;

// static const char *hipcc_scabbard = __SCABBARD_WRAPPER__;
// static const char *clang_scabbard = __SCABBARD_WRAPPER__;
// static const char *clangpp_scabbard = __SCABBARD_WRAPPER__;

/** Return: one if the string t occurs at the end of the string s, and zero otherwise **/
int str_end(const char *s, const char *t)
{
    if (strlen(s) < strlen(t)) return 0;
    return 0 == strcmp(&s[strlen(s)-strlen(t)], t);
}

int isHIPCC(const char* filename) {
  return (str_end(filename, "/hipcc") ||
          strcmp(filename, "hipcc")==0
          );
}

int isClang(const char* filename) {
  return (str_end(filename, "/clang") || 
          strcmp(filename, "clang")==0
          );
}

int isClangPP(const char* filename) {
  return (str_end(filename, "/clang++") || 
          strcmp(filename, "clang++")==0
          );
}

int isGCC(const char* filename) {
  return (str_end(filename, "/gcc") || 
          strcmp(filename, "gcc")==0
          );
}

int isGPP(const char* filename) {
  return (str_end(filename, "/g++") || 
          strcmp(filename, "g++")==0
          );
}

int isMPI(const char* filename) {
  return (str_end(filename, "/mpicc") || 
          strcmp(filename, "mpicc")==0
          );
}

int isMPIPP(const char* filename) {
  return (str_end(filename, "/mpicxx") || 
          str_end(filename, "/mpic++") ||
          strcmp(filename, "mpicxx")==0 ||
          strcmp(filename, "mpic++")==0
          );
}

void printEnvironment(char* const envp[]) {
  size_t elems = 0;
  while (envp != NULL) {
    if (*envp == NULL)
      break;

    elems++;
    printf("VAR: %s\n", *envp);
    envp++;
  }
  printf("Elems: %lu\n", elems);
}

/* Copy the environment without LD_PRELOAD */
void copy_env_variables(char* const envp[], char *** new_envp) {
  char **ptr = (char **)envp;
  size_t elems = 0;
  printf("[intercept.copy_env:DBG] count loop\n"); //DEBUG
  while (ptr != NULL) {
    printf("[intercept.copy_env:DBG] #%ld\n",elems); //DEBUG
    if (*ptr == NULL)
      break;
    elems++;
    ptr++;
  }

  *new_envp = (char **)malloc(sizeof(char *)*elems+1); 
  printf("[intercept.copy_env:DBG] copy loop\n"); //DEBUG
  for (size_t i=0; i < elems; ++i) {
    (*new_envp)[i] = (char *)malloc(strlen(envp[i]) * sizeof(char) + 1);
    printf("[intercept.copy_env:DBG] #%ld\n",i); //DEBUG
    if (strstr (envp[i], "LD_PRELOAD=") == NULL) { // do not copy ld_preload
      strcpy((*new_envp)[i], envp[i]);
    } else {
      strcpy((*new_envp)[i], "LD_PRELOAD=");
    }
  }
  printf("[intercept.copy_env:DBG] terminate list with NULL\n"); //DEBUG
  (*new_envp)[elems] = NULL;
  printf("[intercept.copy_env:DBG] END\n"); //DEBUG
}

/* Copy the old argv with the filename inserted as the first element */
void copy_command(const char* filename, char* const argv[], char *** new_argv) {
  printf("[intercept.copy_cmd:DBG] START\n"); //DEBUG
  char **ptr = (char **)argv;
  size_t elems = 0;
  printf("[intercept.copy_cmd:DBG] count loop\n"); //DEBUG
  while (ptr != NULL) {
    printf("[intercept.copy_cmd:DBG] #%ld\n",elems); //DEBUG
    if (*ptr == NULL)
      break;
    elems++;
    ptr++;
  }

  *new_argv = (char **)malloc(sizeof(char *)*(elems+2));
  printf("[intercept.copy_cmd:DBG] name copy\n"); //DEBUG
  (*new_argv)[0] = (char *)malloc(strlen(filename) * (sizeof(char) + 1));
  strcpy((*new_argv)[0], filename);
  printf("[intercept.copy_cmd:DBG] copy loop\n"); //DEBUG
  for (size_t i=0; i < elems; ++i) {
    printf("[intercept.copy_cmd:DBG] #%ld\n",i); //DEBUG
    (*new_argv)[i+1] = (char *)malloc(strlen(argv[i]) * (sizeof(char) + 1));
    strcpy((*new_argv)[i+1], argv[i]);
  }
  printf("[intercept.copy_cmd:DBG] terminate list with NULL\n"); //DEBUG
  (*new_argv)[elems+1] = NULL;
  printf("[intercept.copy_cmd:DBG] END\n"); //DEBUG
}

/* Remove LD_PRELOAD library to avoid a cycle in pre-loading */
void remove_ld_preload() {
    unsetenv("LD_PRELOAD");
    unsetenv("DYLD_INSERT_LIBRARIES");
}

int execve(const char* filename, char* const argv[], char* const envp[]) {
    printf("[intercept.c:DBG] intercepted `execve`\n"); //DEBUG
    // Copy env variables
    char ** new_envp = NULL;
    char ** new_argv = NULL; 
    const char* SCABBARD_PATH = getenv("SCABBARD_PATH");
    char SCABBARD_WRAPPER[1024];
    assert(SCABBARD_PATH != NULL && "SCABBARD_PATH is defined in your environment");
    copy_env_variables(envp, &new_envp);
    printf("[intercept.c:DBG] copy env done\n"); //DEBUG
    printf("[intercept.c:DBG] copy cmd done\n"); //DEBUG
    printf("[intercept.c:DBG]    old: `%s %s`\n"); //DEBUG
    copy_command(filename, argv, &new_argv);
    snprintf(SCABBARD_WRAPPER, sizeof(SCABBARD_WRAPPER),
            "%s/driver.py", SCABBARD_PATH); // getenv might be unsafe if SCABBARD_PATH is not defined
    printf("[intercept.c:DBG] `%s %s ...`\n", SCABBARD_WRAPPER, new_argv[0]); //DEBUG
    old_execve = dlsym(RTLD_NEXT, "execve");

    // if (isHIPCC(filename))         return old_execve(hipcc_scabbard, argv, new_envp);
    // else if (isClang(filename))   return old_execve(clang_scabbard, argv, new_envp);
    // else if (isClangPP(filename)) return old_execve(clangpp_scabbard, argv, new_envp);
    // else if (isGCC(filename))     return old_execve(clang_scabbard, argv, new_envp);
    // else if (isGPP(filename))     return old_execve(clangpp_scabbard, argv, new_envp);
    // return old_execve(filename, argv, envp); // else run original call


    return old_execve(SCABBARD_WRAPPER, new_argv, new_envp);
}

int execv(const char *path, char *const argv[]) {
    printf("[intercept.c:DBG] intercepted `execv`\n");  //DEBUG
    char ** new_argv;
    const char* SCABBARD_PATH = getenv("SCABBARD_PATH");
    char SCABBARD_WRAPPER[1024];
    assert(SCABBARD_PATH != NULL && "SCABBARD_PATH is defined in your environment");
    copy_command(path, argv, &new_argv);
    snprintf(SCABBARD_WRAPPER, sizeof(SCABBARD_WRAPPER),
            "%s/driver.py", SCABBARD_PATH); // getenv might be unsafe if SCABBARD_PATH is not defined
    printf("[intercept.c:DBG] `%s %s ...`\n", SCABBARD_WRAPPER, new_argv[0]); //DEBUG
    remove_ld_preload();
  // if (isHIPCC(path) || isClang(path) || isClangPP(path))
  //     remove_ld_preload();
    old_execv = dlsym(RTLD_NEXT, "execv");

    // if (isHIPCC(path))         return old_execv(hipcc_scabbard, argv);
    // else if (isClang(path))   return old_execv(clang_scabbard, argv);
    // else if (isClangPP(path)) return old_execv(clangpp_scabbard, argv);
    // else if (isGCC(path))     return old_execv(clang_scabbard, argv);
    // else if (isGPP(path))     return old_execv(clangpp_scabbard, argv);
    // return old_execv(path, argv); // else run original call

    return old_execv(SCABBARD_WRAPPER, new_argv);
}

int execvp (const char *file, char *const argv[]) {
  printf("[intercept.c:DBG] intercepted `execvp`\n"); //DEBUG
  char ** new_argv; 
  const char* SCABBARD_PATH = getenv("SCABBARD_PATH");
  assert(SCABBARD_PATH != NULL && "SCABBARD_PATH is defined in your environment");
  char SCABBARD_WRAPPER[1024];
  copy_command(file, argv, &new_argv);
  snprintf(SCABBARD_WRAPPER, sizeof(SCABBARD_WRAPPER),
          "%s/driver.py", SCABBARD_PATH); // getenv might be unsafe if SCABBARD_PATH is not defined
  printf("[intercept.c:DBG] `%s %s ...`\n", SCABBARD_WRAPPER, new_argv[0]); //DEBUG
  remove_ld_preload();
  // if (isHIPCC(file) || isClang(file) || isClangPP(file))
  //   remove_ld_preload();
  old_execvp = dlsym(RTLD_NEXT, "execvp");

  // if (isHIPCC(file))         return old_execvp(hipcc_scabbard, argv);
  // else if (isClang(file))   return old_execvp(clang_scabbard, argv);
  // else if (isClangPP(file)) return old_execvp(clangpp_scabbard, argv);
  // else if (isGCC(file))     return old_execvp(clang_scabbard, argv);
  // else if (isGPP(file))     return old_execvp(clangpp_scabbard, argv);
  // return old_execvp(file, argv); // else run original call

  return old_execvp(SCABBARD_WRAPPER, new_argv);
}

int execvpe(const char *file, char *const argv[], char *const envp[]) {
    printf("[intercept.c:DBG] intercepted `execvpe`\n"); //DEBUG
    char ** new_envp;
    char ** new_argv;
    const char* SCABBARD_PATH = getenv("SCABBARD_PATH");
    char SCABBARD_WRAPPER[1024];
    assert(SCABBARD_PATH != NULL && "SCABBARD_PATH is defined in your environment");
    copy_env_variables(envp, &new_envp);
    copy_command(file, argv, &new_argv);
    snprintf(SCABBARD_WRAPPER, sizeof(SCABBARD_WRAPPER),
            "%s/driver.py", SCABBARD_PATH); // getenv might be unsafe if SCABBARD_PATH is not defined
    printf("[intercept.c:DBG] `%s %s ...`\n", SCABBARD_WRAPPER, new_argv[0]); //DEBUG
    old_execvpe = dlsym(RTLD_NEXT, "execvpe");

    // if (isHIPCC(file))         return old_execvpe(hipcc_scabbard, argv, new_envp);
    // else if (isClang(file))   return old_execvpe(clang_scabbard, argv, new_envp);
    // else if (isClangPP(file)) return old_execvpe(clangpp_scabbard, argv, new_envp);
    // else if (isGCC(file))     return old_execvpe(clang_scabbard, argv, new_envp);
    // else if (isGPP(file))     return old_execvpe(clangpp_scabbard, argv, new_envp);
    // return old_execvpe(file, argv, envp); // else run original call

    return old_execvpe(SCABBARD_WRAPPER, new_argv, new_envp);
}