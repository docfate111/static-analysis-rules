#include <stdio.h>
#include <stdlib.h>
#include <bsd/string.h>
#define MAX_SIZE 10

int main(int argc, char** argv) {
	if(argc != 3) {
		puts("pass in 2 arguments");
		return 1;
	}
	char buffer1[MAX_SIZE];
	char buffer2[MAX_SIZE];
	char buffer3[MAX_SIZE];
	size_t length = 0;
	memset(buffer1, 'A', MAX_SIZE);
	memset(buffer3, 'B', MAX_SIZE);
	// how much wanted to write not actually written
	// also null terminates so the string is the size-1 + a null byte
	length = strlcpy(buffer2, argv[1], MAX_SIZE);
	printf("Buffer1: %s\nBuffer2(argv[1]): %s\n", buffer1, buffer2);
	printf("Buffer3: %s\n", buffer3);

	printf("Length: %d\n", length);
	printf("strlen: %d\n", strlen(buffer2));
	// makes sense for strncpy not strlcpy since length can be too big
	printf("strlcpy(buffer2+%d, argv[2], %d);", length, MAX_SIZE-length);
	strlcpy(buffer2+length, argv[2], MAX_SIZE-length);
	return 0;
}
