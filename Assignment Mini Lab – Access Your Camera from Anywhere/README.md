# Remote Video Streaming with ngrok

## Overview

This project demonstrates how to make a local video streaming system accessible from the Internet using **ngrok**.

The system streams video from a local camera using a Flask server and exposes it through a public URL so it can be accessed remotely.

Pipeline workflow:

Camera → Local Server → Internet Tunnel → Remote User

## ngrok Public URL

Public stream URL: https://workmanlike-nonspiritually-phung.ngrok-free.dev/

## How the System Was Started

1. The local video streaming server was started using:

   python app.py

2. The stream was available locally at:

   http://localhost:5000

3. ngrok was started to expose the server:

   ngrok http 5000

4. ngrok generated a public URL that allows access to the video stream from any network.

## Result

The system worked successfully:

* the camera stream ran locally
* ngrok generated a public URL
* the video stream was accessible from outside the local network

## Screenshots

The repository includes screenshots showing:

* ngrok running in the terminal
* the generated public URL
* the video stream opened from another device
