---
title: "5200 - Streaming Client Server with ABE"
description: "Streaming Client Server with ABE."
date: 2023-01-12T11:09:01-06:00
lastmod: 2023-01-12T11:09:01-06:00
draft: false
menu:
  docs:
    parent: "assignments"
    identifier: "5200-Additional-Assignment"
weight: 20
---

# Streaming Client-Server with Attribute-Based Encryption (ABE) Assignment

## Objective

The primary objective of this assignment is to build a streaming client-server application that employs Attribute-Based Encryption (ABE) for securing key frames. Students are required to implement the client and server, stream media between them, identify key frames to be encrypted, and perform encryption and decryption using ABE. Additionally, the quality of experience (QoE) must be quantified through metrics such as jitter and delay.

## Prerequisites

- Familiarity with Python or a comparable programming language
- Basic understanding of client-server architecture
- Knowledge of video streaming and basic cryptography
- Experience working with encryption libraries

---

## Tasks

### Part 1: Setup

1. **Install ABE Libraries**: Install the required Attribute-Based Encryption (ABE) libraries on both client and server systems.
2. **Install Streaming Software**: Install or implement streaming software capable of serving as a client and server.

### Part 2: Basic Streaming

1. **Stream Video**: Stream a video file from the server to the client. You may use any readily available video for this task.
2. **Identify Key Frames**: Write a program that identifies key frames from the video stream.

### Part 3: Encryption and Decryption

1. **Encrypt Key Frames**: Use the ABE algorithm to encrypt the identified key frames.
2. **Stream Encrypted Video**: Stream the video with encrypted key frames from the server to the client.
3. **Decrypt and Render**: Implement logic on the client to decrypt the key frames and render the video stream.

### Part 4: Quality Metrics

1. **Measure Jitter**: Implement a function to measure and log the jitter experienced during the streaming process.
2. **Measure Delay**: Implement a function to measure and log the delay in the video stream.
3. **Quantify QoE**: Utilizing the jitter and delay metrics, quantify the Quality of Experience (QoE).

---

## Evaluation Criteria

- Functional completeness of the client-server streaming system
- Successful encryption and decryption using ABE
- Accuracy and completeness in measuring jitter, delay, and QoE
- Code readability, organization, and documentation

---

## Submission Guidelines

- Submit your source code files, scripts, and any supplementary documents in a zipped folder.
- Include a README.md file that explains how to compile and run your programs, along with any necessary setup instructions.
- Deadline: Nov 19th, 2023

---

## References

- ABE Library Documentation: https://acsc.cs.utexas.edu/cpabe/
- Video Streaming Protocols and Tools: TBD
- Quality of Experience (QoE) Metrics: TBD

---
