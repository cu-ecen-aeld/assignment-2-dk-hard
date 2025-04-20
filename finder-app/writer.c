#include <stdio.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
	int err;
	if(argc != 3)
	{
		printf("Usage: writer <file path> <content>");
		return 1;
	}
	openlog(NULL, 0, LOG_USER);
	FILE *fp;
	fp = fopen(argv[1], "w");
	if (NULL == fp)
	{
		err = errno;
		perror("fopen failed");
		syslog(LOG_ERR, "fopen failed with %s", strerror(err));
		return 1;
	}

	if(fputs(argv[2], fp) == EOF)
	{
		perror("fputs failed");
		return 1;
	}
	syslog(LOG_DEBUG, "Writing %s to file %s", argv[2], argv[1]);
	return 0;
}
