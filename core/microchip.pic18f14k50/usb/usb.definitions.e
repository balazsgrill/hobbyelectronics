library usb.definitions;

use e.platform;
use microchip.pic18;
use microchip.PIC18F14K50;

const uint8 USB_DELIVERY_BUFFER_SIZE = 8;

type USBDeliveryBuffer = array [USB_DELIVERY_BUFFER_SIZE] of uint8;

type USB_BDArray = array [256] of uint8;
type USB_BufferDescriptor = array[4] of uint8;

const address USB_BDT_ADDRESS = 0x200;
const address USB_BASE_ADDRESS = USB_BDT_ADDRESS;
const address USB_IN_DELIVERY_BUFFER_LOC = ( USB_BASE_ADDRESS + 0x0078 );

reg USBDeliveryBuffer usb_delivery_buffer : USB_IN_DELIVERY_BUFFER_LOC;
uint8 usb_delivery_bytes_max_send;
uint8 usb_delivery_bytes_sent;
uint8 usb_delivery_buffer_size;
uint8 usb_delivery_bytes_to_send;

const uint8 USB_HIGHEST_EP = 3;
const bool USB_SELF_POWERED = 1;

const address usb_sdp_loc = ( USB_BASE_ADDRESS + 0x00F8 );

reg USBDeliveryBuffer usb_sdp : usb_sdp_loc;
reg uint8 usb_sdp_request_type : usb_sdp_loc;
reg uint8 usb_sdp_request : usb_sdp_loc + 1;
reg uint16 usb_sdp_value : usb_sdp_loc + 2;
reg uint16 usb_sdp_index : usb_sdp_loc + 4;
reg uint16 usb_sdp_length : usb_sdp_loc + 6;

//USB_STATUS
const uint8 USB_STATUS_IDLE 			= 0;
const uint8 USB_STATUS_SET_ADDRESS 		= 1;
	
//USB STATE
const uint8 USB_STATE_POWERED	= 0; 	// USB device is powered up, ready to start negotiating
const uint8 USB_STATE_DEFAULT 	= 1;	// USB device is now negotiating
const uint8 USB_STATE_ADDRESS 	= 2;	// USB device now has an address
const uint8 USB_STATE_CONFIGURED= 3; 	// USB device is completely configured and ready to rock and roll 

//USB COMMAND MODES
const uint8 USB_CM_IDLE 						= 0; // No control transfer taking place
const uint8 USB_CM_CTRL_WRITE_DATA_STAGE 		= 1; // Device receiving data during the data stage 
const uint8 USB_CM_CTRL_WRITE_DATA_STAGE_CLASS	= 2; // Device receiving data during the data stage destined for the class 
const uint8 USB_CM_CTRL_READ_DATA_STAGE 		= 3; // Device sending data during the data stage
const uint8 USB_CM_CTRL_READ_DATA_STAGE_CLASS 	= 4; // Device class is sending data during the data stage
const uint8 USB_CM_CTRL_READ_AWAITING_STATUS 	= 5; // Device is awaiting reception of status after sending data
const uint8 USB_CM_CTRL_WRITE_SENDING_STATUS 	= 6; // Device is sending status after receiving data 

// USB REQUESTS
const uint8 USB_REQUEST_GET_STATUS 			= 0x00;
const uint8 USB_REQUEST_CLEAR_FEATURE 		= 0x01;
const uint8 USB_REQUEST_SET_FEATURE			= 0x03;
const uint8 USB_REQUEST_SET_ADDRESS			= 0x05;
const uint8 USB_REQUEST_GET_DESCRIPTOR		= 0x06;
const uint8 USB_REQUEST_SET_DESCRIPTOR		= 0x07;
const uint8 USB_REQUEST_GET_CONFIGURATION 	= 0x08;
const uint8 USB_REQUEST_SET_CONFIGURATION 	= 0x09;
const uint8 USB_REQUEST_GET_INTERFACE 		= 0x0a;
const uint8 USB_REQUEST_SET_INTERFACE 		= 0x0b;
const uint8 USB_REQUEST_REQ_SYNCH_FRAME 	= 0x0c;

// Bits of BDn.stat when UOWN = 0
const bit USB_BDSTATUS_UOWN	= 7; // 0 if uC owns buffer
const bit USB_BDSTATUS_DTS		= 6; // 1 data 1 packet, 0 data 0 packet
const bit USB_BDSTATUS_KEN		= 5; // 1 USB will keep buffer indefinately, 0 USB will hand back buffer
const bit USB_BDSTATUS_INCDIS 	= 4; // 1 Address increment disabled (for SPP), 0 address increment enabled
const bit USB_BDSTATUS_DTSEN	= 3; // 1 data toggle sync on, 0 data toggle sync off
const bit USB_BDSTATUS_BSTALL	= 2; // 1 buffer stall enabled, 0 buffer stall disabled
const bit USB_BDSTATUS_BC9		= 1; // bit 9 of buffer count
const bit USB_BDSTATUS_BC8		= 0; // bit 8 of buffer count

const bit USB_DATA_STAGE_DIR_BIT = 7;
const bit USB_REQUEST_TYPE1_BIT	= 6; // 00= USB standard request
const bit USB_REQUEST_TYPE0_BIT = 5; // 01= Request for a specific class
// const byte USB_REQUEST_TYPE_MASK = 0b_0110_000
// 10= Vendor specific
//						
//  Bits 4-0 define recipient bits
// 0b00000= Device
// 0b00001= Specific interface
// 0b00010= Endpoint
// 0b00011= Other element (whatever that means)

//Token
const uint8 USB_PID_OUT 	= b00000001;
const uint8 USB_PID_IN 		= b00001001;
const uint8 USB_PID_SOF 	= b00000101;
const uint8 USB_PID_SETUP 	= b00001101;

// Data
const uint8 USB_PID_DATA0 = b00000011;
const uint8 USB_PID_DATA1 = b00001011;
const uint8 USB_PID_DATA2 = b00000111;
const uint8 USB_PID_MDATA = b00001111;

// Handshake
const uint8 USB_PID_ACK		= b00000010;
const uint8 USB_PID_NAK		= b00001010;
const uint8 USB_PID_STALL	= b00001110;
const uint8 USB_PID_NYET	= b00000110;

uint8 usb_state; // = USB_STATE_POWERED
uint8 usb_status;
uint8 usb_control_mode;
uint8 usb_address;

reg USB_BDArray usb_bd_array : ( USB_BASE_ADDRESS + 0x0000 );

reg USB_BufferDescriptor usb_bd0out : ( USB_BASE_ADDRESS + 0x0000 );
reg uint8 usb_bd0out_stat 	: &usb_bd0out;
reg uint8 usb_bd0out_cnt   	: &usb_bd0out+1;
reg uint16 usb_bd0out_addr 	: &usb_bd0out+2;

reg USB_BufferDescriptor usb_bd0in : ( USB_BASE_ADDRESS + 0x0004 );
reg uint8 usb_bd0in_stat 	: &usb_bd0in;
reg uint8 usb_bd0in_cnt   	: &usb_bd0in+1;
reg uint16 usb_bd0in_addr 	: &usb_bd0in+2;

reg USB_BufferDescriptor usb_bd1out : ( USB_BASE_ADDRESS + 0x0008 );
reg uint8 usb_bd1out_stat 	: &usb_bd1out;
reg uint8 usb_bd1out_cnt   	: &usb_bd1out+1;
reg uint16 usb_bd1out_addr 	: &usb_bd1out+2;

reg USB_BufferDescriptor usb_bd1in : ( USB_BASE_ADDRESS + 0x000C );
reg uint8 usb_bd1in_stat 	: &usb_bd1in;
reg uint8 usb_bd1in_cnt   	: &usb_bd1in+1;
reg uint16 usb_bd1in_addr 	: &usb_bd1in+2;

reg USB_BufferDescriptor usb_bd2out : ( USB_BASE_ADDRESS + 0x0010 );
reg uint8 usb_bd2out_stat 	: &usb_bd2out;
reg uint8 usb_bd2out_cnt   	: &usb_bd2out+1;
reg uint16 usb_bd2out_addr 	: &usb_bd2out+2;

reg USB_BufferDescriptor usb_bd2in : ( USB_BASE_ADDRESS + 0x0014 );
reg uint8 usb_bd2in_stat 	: &usb_bd2in;
reg uint8 usb_bd2in_cnt   	: &usb_bd2in+1;
reg uint16 usb_bd2in_addr 	: &usb_bd2in+2;

reg USB_BufferDescriptor usb_bd3out : ( USB_BASE_ADDRESS + 0x0018 );
reg uint8 usb_bd3out_stat 	: &usb_bd3out;
reg uint8 usb_bd3out_cnt   	: &usb_bd3out+1;
reg uint16 usb_bd3out_addr 	: &usb_bd3out+2;

reg USB_BufferDescriptor usb_bd3in : ( USB_BASE_ADDRESS + 0x001C );
reg uint8 usb_bd3in_stat 	: &usb_bd3in;
reg uint8 usb_bd3in_cnt   	: &usb_bd3in+1;
reg uint16 usb_bd3in_addr 	: &usb_bd3in+2;

reg USB_BufferDescriptor usb_bd4out : ( USB_BASE_ADDRESS + 0x0020 );
reg uint8 usb_bd4out_stat 	: &usb_bd4out;
reg uint8 usb_bd4out_cnt   	: &usb_bd4out+1;
reg uint16 usb_bd4out_addr 	: &usb_bd4out+2;

reg USB_BufferDescriptor usb_bd4in : ( USB_BASE_ADDRESS + 0x0024 );
reg uint8 usb_bd4in_stat 	: &usb_bd4in;
reg uint8 usb_bd4in_cnt   	: &usb_bd4in+1;
reg uint16 usb_bd4in_addr 	: &usb_bd4in+2;

reg USB_BufferDescriptor usb_bd5out : ( USB_BASE_ADDRESS + 0x0028 );
reg uint8 usb_bd5out_stat 	: &usb_bd5out;
reg uint8 usb_bd5out_cnt   	: &usb_bd5out+1;
reg uint16 usb_bd5out_addr 	: &usb_bd5out+2;

reg USB_BufferDescriptor usb_bd5in : ( USB_BASE_ADDRESS + 0x002C );
reg uint8 usb_bd5in_stat 	: &usb_bd5in;
reg uint8 usb_bd5in_cnt   	: &usb_bd5in+1;
reg uint16 usb_bd5in_addr 	: &usb_bd5in+2;

const u8bit EP1STALL	= microchip.pic18.u8bit{&UEP1,0};
const u8bit EP1INEN		= microchip.pic18.u8bit{&UEP1,1};
const u8bit EP1OUTEN	= microchip.pic18.u8bit{&UEP1,2};
const u8bit EP1CONDIS	= microchip.pic18.u8bit{&UEP1,3};
const u8bit EP1HSHK		= microchip.pic18.u8bit{&UEP1,4};

const u8bit EP2STALL	= microchip.pic18.u8bit{&UEP2,0};
const u8bit EP2INEN		= microchip.pic18.u8bit{&UEP2,1};
const u8bit EP2OUTEN	= microchip.pic18.u8bit{&UEP2,2};
const u8bit EP2CONDIS	= microchip.pic18.u8bit{&UEP2,3};
const u8bit EP2HSHK		= microchip.pic18.u8bit{&UEP2,4};

const u8bit EP3STALL	= microchip.pic18.u8bit{&UEP3,0};
const u8bit EP3INEN		= microchip.pic18.u8bit{&UEP3,1};
const u8bit EP3OUTEN	= microchip.pic18.u8bit{&UEP3,2};
const u8bit EP3CONDIS	= microchip.pic18.u8bit{&UEP3,3};
const u8bit EP3HSHK		= microchip.pic18.u8bit{&UEP3,4};

//----------------------------------------------------
const uint8 USB_DEVICE_DESCRIPTOR_SIZE = 18;
const uint8 USB_DT_DEVICE = 0x01;
const uint8 USB_DT_CONFIGURATION = 0x02;
const uint8 USB_DT_STRING = 0x03;
const uint8 USB_DT_INTERFACE = 0x04;
const uint8 USB_DT_ENDPOINT = 0x05;
const uint8 USB_DT_DEVICE_QUALIFIER = 0x06;
const uint8 USB_DT_OTHER_SPEED_CONFIG = 0x07;
const uint8 USB_DT_INTERFACE_POWER = 0x08;
const uint8 USB_DT_OTG = 0x09;
const uint8 USB_DT_DEBUG = 0x0a;
const uint8 USB_DT_INTERFACE_ASSOC = 0x0b;
const uint8 USB_DT_HID = 0x21;
const uint8 USB_DT_HID_REPORT = 0x22;

const uint8 USB_DT_CS_INTERFACE = 0x24;

const uint8 USB_EP_CTRL 		= 0x06; // Cfg Control pipe for this ep
const uint8 USB_EP_OUT 			= 0x0C; // Cfg OUT only pipe for this ep
const uint8 USB_EP_IN       	= 0x0A; // Cfg IN only pipe for this ep
const uint8 USB_EP_OUT_IN   	= 0x0E; // Cfg both OUT & IN pipes for this ep
const uint8 USB_HSHK_EN     	= 0x10; // Enable handshake packet
 
 
// Device Class Code
const uint8 USB_CDC_DEVICE = 0x02;

// Communication Interface Class Code
const uint8 USB_COMM_INTF = 0x02;
 
// Vendor specific interface code
const uint8 USB_VENDOR_INTF = 0xFF;
 
// Communication Interface Class SubClass Codes
const uint8 USB_ABSTRACT_CONTROL_MODEL = 0x02;

// Communication Interface Class Control Protocol Codes
const uint8 USB_V25TER = 0x01; // Common AT commands ("Hayes(TM)")

const  uint8 USB_BD_STAT_IDX  = 0x00;
const  uint8 USB_BD_CNT_IDX   = 0x01;
const  uint8 USB_BD_ADDRH_IDX = 0x02;
const  uint8 USB_BD_ADDRL_IDX = 0x03;


const uint8 USB_HID_INTF = 0x03;
const uint8 USB_BOOT_INTF_SUBCLASS = 0x01;


// HID Interface Class Protocol Codes
const uint8 USB_HID_PROTOCOL_NONE 		= 0x00;
const uint8 USB_HID_PROTOCOL_KEYBOARD 	= 0x01;
const uint8 USB_HID_PROTOCOL_MOUSE 		= 0x02;

// Endpoint Transfer Type
const uint8 USB_EPT_CTRL       = 0x00; // Control Transfer
const uint8 USB_EPT_ISO        = 0x01; // Isochronous Transfer
const uint8 USB_EPT_BULK       = 0x02; // Bulk Transfer
const uint8 USB_EPT_INT        = 0x03; // Interrupt Transfer


const uint8 USB_PULLUP_ENABLE = 0x10;
const uint8 USB_PULLUP_DISABLED = 0x00;

const uint8 USB_INTERNAL_TRANSCEIVER = 0x00;
const uint8 USB_EXTERNAL_TRANSCEIVER = 0x08;

const uint8 USB_FULL_SPEED = 0x04;
const uint8 USB_LOW_SPEED  = 0x00;

const uint8 USB_PING_PONG__NO_PING_PONG = 0x00;	// b00
const uint8 USB_PING_PONG__EP0_OUT_ONLY = 0x01;	// b01
const uint8 USB_PING_PONG__FULL_PING_PONG = 0x02; // b10
const uint8 USB_PING_PONG__ALL_BUT_EP0 = 0x03;	// b11

