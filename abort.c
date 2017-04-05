#include <sys/types.h>
#include <sys/wait.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main()
{
  pid_t pid;
  int status, exit_status;

  if((pid = fork()) < 0) {
    perror("fork failed");
    exit(1);
  } 

  if(pid == 0) { /* child */
    printf("Child is  %d \n", getpid());
    abort(); /* exit with non-zero value */
}

 while (waitpid(pid, &status, WNOHANG) == 0){ /* Child still running*/
   sleep(1);
  }
  /* how did the child die? */
  if(WIFEXITED(status)) {
    exit_status = WEXITSTATUS(status);
    printf("Exit status from process %d = %d\n", pid, exit_status);
  }
  else if (WIFSIGNALED(status)) {
    exit_status = WTERMSIG(status);
    printf("Abnormal termination from process  %d = %d\n", pid, exit_status);
  }
  exit(0);
}
