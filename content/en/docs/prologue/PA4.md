---
title: "Program 4 - Detect a Person"
sidebar: true # or false to display the sidebar
sidebarlogo: fresh-white-alt # From (static/images/logo/)
draft: False
---
## Due Date - Nov 20, 2023
___
**Objectives**
___

The objective of this assignment is to design and implement a client-server system using Raspberry Pi devices. The server will control an LED, while the client will sense motion using a Passive Infrared Sensor (PIR) and communicate with the server to blink the LED. The assignment includes establishing a three-way handshake, sending blink duration and count information, acknowledging the data, and responding to motion detection by blinking the LED. The client and server communications MUST use UDP (SOCK_DGRAM) and NOT TCP.

The objectives are:

-- Learn about physical computing

-- Learn about protocol development

___
**Server Specifications**
___
The server (we name it lightserver) takes two arguments:

```
$ lightserver -p <PORT> -s <LOG FILE LOCATION> 
```

1.```PORT``` - The port server listens on.

2.```Log File Location``` - log file location

___
**Server's Functional requirements**
___
   1. The server must open a UDP socket on the specified port number
   2. The server should gracefully process incorrect port number and exit with a non-zero error code
   5. The server runs indefinitely - it does not exit.
   6. The server accepts connections from multiple clients (bonus points)
   7. server works with any client developed by other teams (bonus points)

___
***Client Specifications***
___

The client (we name it lightclient) takes three arguments:
<br>

```
$ lightclient -s <SERVER-IP> -p <PORT> -l LOGFILE 
```

The client takes three arguments:

1.```Server IP``` - The IP address of the lightserver.

2.```PORT``` - The port the server listens on.

2.```Log file location``` - Where you will keep a record of packets you received.


```
For example:
$ lightclient -s 192.168.2.1 -p 6543 -l LOGFILE
```
<br>

___
**Packet Specification**
___
The payload of each UDP packet sent by server and client MUST start with the following 12-byte header. All fields are in network order (most significant bit first):

```
   0                   1                   2                   3
   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
  |                     Sequence Number                           |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
  |                     Acknowledgment Number                     |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
  |                     Not Used                            |A|S|F|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```
Where:

1. Sequence Number (32 bits): If SYN is present (the S flag is set) the sequence number is the initial sequence number (randomly choosen).

3. Acknowledgement Number (32 bits): **If the ACK bit is set, this field contains the value of the next sequence number the sender of the segment is expecting to receive. Once a connection is established this is always sent.**

4. The acknowledgement number is given in the unit of bytes (how many bytes you have sent)

6. Not Used (29 bits): Must be zero.

7. A (ACK, 1 bit): Indicates that there the value of Acknowledgment Number field is valid

8. S (SYN, 1 bit): Synchronize sequence numbers

9. F (FIN, 1 bit): Finish, No more data from sender


___
**This is the protocol you will implement**
___

1. The client opens a UDP socket and initiate 3-way handshake to the specified hostname/ip and port.  Essentially, the client and server will exchange three packets with the following flags set: (1) SYN (2) SYN|ACK (3)ACK. At the end of the handshake, they will have learned each other's sequence number.

2. The client then sends the duration and number of blinks as a *payload*.

3. The server acknowledges the duration and the number of blinks.

4. The client senses motion using the PIR.

5. When motion is detected, the client logs it, and sends a message with the following string as the payload *<Timestamp>:MotionDetected*

6. The server parses it, logs *<Timestamp>:MotionDetected* to its log, and drives the LED for the pre-determined amount of times.

8. Client sends a packet with the FIN bit set. The server logs "<Timestamp>:Interaction with <client> completed. This finishes the interaction.

7. Timestamp format is "YYYY-MM-DD-HH-MM-SS".

### Hardware Components
- Raspberry Pi
- Passive Infrared Sensor (PIR)
- LED
- Resistor
- Jumper wires
- Breadboard

### Server Setup
- The server Raspberry Pi should be programmed to drive the LED.
- It should be capable of receiving data from the client and blinking the LED accordingly.

### Client Setup
- The client Raspberry Pi should be programmed to interface with the PIR sensor.
- It should be able to establish a connection with the server.
- The client should continuously sense motion using the PIR sensor.

**You may test both server and client on the same board.**

___
**Submission:**
___
1. Submit your code, packet capture in PCAP format, and your logs as a ZIP file.

___
**Additional requirements:**
___
1. Code must compile/run on the PIs.

2. For each packet received, log both at server and receiver in the following format:
```
"RECV" <Sequence Number> <Acknowledgement Number> ["ACK"] ["SYN"] ["FIN"]
"SEND" <Sequence Number> <Acknowledgement Number> ["ACK"] ["SYN"] ["FIN"]
```
---
**Hints**
---

`  def create_packet(**kwargs):`

    data = struct.pack('!I', s_n) #pack the version
    ....
    data += struct.pack("!c", ack) #pack the ACK
    data += struct.pack("!c", syn) #pack the SYN
    data += struct.pack("!c", fin) #pack the FIN
    ....
    return data    
    
`send_data = create_packet(sequence_number=100, ack_number=0, ack = 'Y', syn = 'N', fin = 'N', payload=data)    `

---
**Rubric**
---

- Protocol design points 1-7 - 10 points each.
- Successful reading from PIR - 10 points.
- Successful LED blinking - 10 points.
- Server can handle multiple clients - 10 points (bonus)
- Works with other teams' implementation - 10 points (bonus)
	- Do not collaborate on code but test with each other's code
	- If your code works with another team's code, you both get 10 points


	
