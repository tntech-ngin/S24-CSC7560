---
title: "Program 1"
description: ""
lead: ""
date: 2023-01-12T11:09:01-06:00
lastmod: 2023-01-12T11:09:01-06:00
draft: false
images: []
menu:
  docs:
    parent: ""
    identifier: "program1-0e4bde5bb61c2a4f1e4d42c95c108a96"
weight: 20
toc: true
---


**This is an INDIVIDUAL Assignment (Do not collaborate)**
**Due - Sept 14, Thursday, 11:59PM**

## Instructions

1. Create two separate Python files for the server and client, named `server.py` and `client.py`, respectively.

2. Copy and paste the provided skeleton code into the respective files.

3. Complete the server code by implementing the missing function calls where indicated by comments. The server should be able to accept connections, receive long messages from clients, process them, and echo back the same message.

4. Complete the client code by implementing the missing function calls where indicated by comments. The client should connect to the server, allow the user to input long messages, send them to the server, and display the server's responses.

5. Test your server and client by running them in separate VMs. Ensure they can communicate and exchange very long messages successfully.

6. You should perform error handling, add comments for clarity, and optimize the code as needed.

7. Submit your completed `server.py` and `client.py` files for evaluation. Submit through iLearn.

Remember to follow good coding practices and error handling techniques. Ensure that your implementation can handle very long messages without issues.

## Server Skeleton Code

```python
import socket

# Create a socket object


# Define the server address and port


# Bind the socket to the server address
# Replace the following line with code to bind the socket

# Listen for incoming connections (max 5 clients in the queue)
# Replace the following line with code to listen for connections

print("Server is listening on", server_address)

while True:
    # Wait for a client to connect
    # Replace the following line with code to accept a client connection
    
    # Print a message to indicate the client connection
    # Replace the following line with appropriate logging

    # Handle client data
    while True:
        # Receive data from the client
        # Replace the following line with code to receive data
        # ensure you can receive long messages
        
        
        # Process and respond to the client's data
        # Replace the following line with your data processing logic
        
        # Send the response back to the client
        # Replace the following line with code to send back the same message

    # Close the client socket
    # Replace the following line with code to close the client socket
```

## Client Skeleton Code

```python
import socket

# Create a socket object

# Define the server address and port

# Connect to the server
# Replace the following line with code to connect to the server

while True:
    # Get user input
    message = input("Enter a message to send to the server (or 'exit' to quit): ")
        
    # Send the message to the server
    # Replace the following line with code to send the message

    # Receive and print the server's response
    # Replace the following line with code to receive and print the response
    # Make sure you are able to receive long messages

# Close the client socket
# Replace the following line with code to close the client socket

```


# Assignment Rubric

### Client Implementation (40 points)

1. **Client Runs (10 points):** 
   - [ ] The client code runs without errors.

2. **Client Runs on Separate VM (10 points):** 
   - [ ] The client can run on a separate VM and communicate with the server.

3. **Exception Handling (10 points):**
   - [ ] The client code correctly checks and raises appropriate exceptions for the following socket-related calls:
     - [ ] `socket.socket()`
     - [ ] `socket.connect()`
     - [ ] `socket.send()`
     - [ ] `socket.recv()`

4. **Long Message Handling (10 points):** 
   - [ ] The client can send and receive very long messages (consider testing with messages of at least 1MB in size).

### Server Implementation (40 points)

5. **Server Runs (10 points):** 
   - [ ] The server code runs without errors.

6. **Server Runs on Separate VM (10 points):** 
   - [ ] The server can run on a separate VM and communicate with the client.

7. **Exception Handling (10 points):**
   - [ ] The server code correctly checks and raises appropriate exceptions for the following socket-related calls:
     - [ ] `socket.socket()`
     - [ ] `socket.bind()`
     - [ ] `socket.listen()`
     - [ ] `socket.accept()`
     - [ ] `socket.send()`
     - [ ] `socket.recv()`

8. **Long Message Handling (10 points):** 
   - [ ] The server can receive and process very long messages (consider testing with messages of at least 1MB in size).

### Best coding practices (20 points)

9. **Error Handling (up to 10 points):** 
   - [ ] Exit gracefully after client receives the message
   - [ ] Server never exits

10. **Code Clarity and Comments (up to 10 points):** 
    - [ ] The code is well-commented and easy to understand, making use of meaningful variable and function names.

Total Points: /100

