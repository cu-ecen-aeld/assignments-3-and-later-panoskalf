#include <stdio.h>
#include <syslog.h>

// #define DEBUG

int main(int argc, char* argv[])
{
    openlog(NULL, 0, LOG_USER);

    // check number of args
    if(3 != argc)
    {
        syslog(LOG_ERR, "Invalid number of argumnets: %d\n", (argc-1));
        return 1;
    }

#ifdef DEBUG
    // add all args to the log if DEBUG macro is defined
    for(int i = 0; i < argc; i++)
    {
        syslog(LOG_ERR, "%s\n", argv[i]);
    }
#endif //#ifdef DEBUG

    char* writefile = argv[1];
    char* writestr = argv[2];

    FILE* file = fopen(writefile, "w");

    // check if file opened
    if(NULL == file)
    {
        syslog(LOG_ERR, "Cannot open file: %m");
    }

    syslog(LOG_DEBUG, "Writing %s to %s\n", writestr, writefile);
    int ret = fprintf(file, "%s", writestr);

    // check if fprintf succeeded
    if(0 > ret)
    {
        syslog(LOG_ERR, "Cannot write file: %m");
    }

    fclose(file);
    closelog();

    return 0;
}