#include <stdio.h>  
#include <unistd.h>

int main()  
 {  
      pid_t pid;  
      pid = vfork(); 
      if(pid==0)  
      {  
          printf("Child\n");  
      }  
	
	else if (pid > 0)
	{
	printf("Parent\n");
	}

   else 
      printf ( "Fork failed, no child\n" ); 
      return 0;  
  }
