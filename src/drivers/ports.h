// this function reads a byte from a specified hardware port
unsigned char byte_port_in(unsigned short port);

// this function writes a byte from a specified hardware port
void byte_port_out(unsigned short port, unsigned char data);

// this function reads a word (2 bytes) from a specified hardware port
unsigned short word_port_in(unsigned short port);

// this function writes a word (2 bytes) from a specified hardware port
void word_port_out(unsigned short port, unsigned short data);