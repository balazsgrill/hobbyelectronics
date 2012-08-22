usbtest.o : usbtest.c
	gcc -c -o usbtest.o usbtest.c

usbtest.exe : usbtest.o
	gcc -o usbtest.exe usbtest.o libusb-1.0.a

xusb.o : xusb.c
	gcc -c -D -o xusb.o xusb.c

xusb.exe : xusb.o
	gcc -o xusb.exe xusb.o libusb-1.0.a


all : usbtest.exe xusb.exe
	@echo done
