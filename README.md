Duo Gamer SDK for iOS
=====================

Mimimal SDK to use the Duo Gamer Bluetooth controller on iOS

## Quick test
* Compile and install the DuoGamerTest command line tool
* Start it and connect the Duo Gamer
* After connection, it will print the controller state to the console

## Use in your UIKit app

* Add DuoGamerSDK.h and DuoGamerSDK.m to your project
* Add the ExternalAccessory framework to your project
* Add "com.discoverybaygames.v2" to the UISupportedExternalAccessoryProtocols
  array in your Info.plist
* Implement the DuoGamerDelegate protocol
* During startup, create an DuoGamer object and set its delegate 
* Process incoming state changes in the -handleState:(DuoGamerState*)state method

## Details

The Duo Gamer is an Made for iPhone device and periodically sends its state
to the ExternalAccessory client. Each state packet consists of 11 bytes and 
contains framing information and a basic XOR checksum.

The packet looks like this:
0x5a 0xa5 0x04 RightPad LeftPad LeftX LeftY RightX RightY 0x00 CHECKSUM
- RightPad: A=Down=0x01, B=Right=0x02, X=Left=0x04, Y=Up=0x08
- LeftPad: R1 = 0x01, L1 = 0x02, Up=0x04, Right=0x08, Down=0x10, Left=0x20
- LeftX, LeftY, RightX, RightY: Analog value from 0-255, 128 is neutral
- Checksum: XOR over bytes 0x02-0a0x

