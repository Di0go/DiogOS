#include "../drivers/ports.h"

void main() 
{
    //pointer to the first cell of video memory (top left corner of the screen)
    char* videoMemory = (char*) 0xb8000;
    // de-reference pointer and store a K in video memory
    *videoMemory = 'Y';
}