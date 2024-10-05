# iriun_app_launcher for Android

This PowerShell script allows you to control the **iriun Webcam** app on your Android device via ADB. You can use it to either start the app or stop it and lock the device screen. The script wakes up the device if the screen is off and ensures that the app is running.
This can be used for other applications also, just find and update the `$packageName` of the package you would like to stop or start.
Important to note this script originated from a WFH need and I did not constantly want to move my laptop for camera on meetings, instead I setup an unused mobile phone on a desk clamp that I can start the webcam application remotely when I need it.

## Prerequisites

- **ADB (Android Debug Bridge)**: Make sure ADB is installed and added to your system's PATH.
  - You can download it from [here](https://developer.android.com/studio/releases/platform-tools).
- **Android device** with developer options and USB debugging enabled.
- Ensure **iriun Webcam** is installed on your Android device  
- Ensure **iriun Webcan** in also installed on your PC  

## Script Overview

The script has two main functions:
- **Start iriun**: Wakes the device, unlocks the screen (if no passcode is set), and starts the iriun app.
- **Stop iriun**: Stops the iriun app if it's running and locks the device screen.

## Usage

You can use this script by passing either `start` or `stop` as an argument from the command line.

### Start iriun

To wake the device and start the iriun Webcam app:

```powershell
.\iriun.ps1 start
```

To stop the iriun Webcam app and lock the device screen:
```powershell
.\iriun.ps1 stop
```

### Notes
Ensure that your Android device is connected to your computer and recognized by ADB (adb devices).
This script assumes no passcode or fingerprint is required to unlock the device. If your device is locked with a passcode, you would need to manually unlock it.

### License
This script is provided "as is" without warranty of any kind. Use it at your own risk.
This does not modify the irium webcam application in any way and is only used to start the application on your android phone.  
[GPLv3](./LICENSE)

