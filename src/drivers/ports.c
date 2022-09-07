unsigned char byte_port_in(unsigned short port) 
{
    //using char because it stores 1 byte and short because it stores 2
    //var to store and return the result
    unsigned char byte;

    //using inline assembly, remember different achitecture from x86 
    // instruction, output operands, input operands
    // "=a" (byte): store what's in AL in variable byte
    __asm__ volatile(
        "in %%dx, %%al" : "=a" (byte) : "d" (port) 
    );

    return byte;
}

void byte_port_out(unsigned short port, unsigned char data) 
{
    __asm__ volatile(
        //empty space between the :'s because we don't want any output variables
        // "a" (data): load EAX with data
        // "d" (port): load EDX with port
        "out %%dx, %%al" : : "a" (data), "d" (port) 
    );
}

unsigned short word_port_in(unsigned short port) 
{
    unsigned short word;

    __asm__ volatile(
        "in %%dx, %%al" : "=a" (word) : "d" (port) 
    );

    return word;
}

void word_port_out(unsigned short port, unsigned short data) 
{
    __asm__ volatile(
        "out %%dx, %%al" : : "a" (data), "d" (port) 
    );
}