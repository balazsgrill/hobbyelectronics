listdevs.o : listdevs.c
	gcc -c -o listdevs.o listdevs.c

listdevs.exe : listdevs.o
	gcc -o listdevs.exe listdevs.o libusb-1.0.a

xusb.o : xusb.c
	gcc -c -D -o xusb.o xusb.c

xusb.exe : xusb.o
	gcc -o xusb.exe xusb.o libusb-1.0.a


all : listdevs.exe xusb.exe
	@echo done
