nasm -f win64 cvtRGBToGray.asm
gcc -o main main.c cvtRGBToGray.obj
