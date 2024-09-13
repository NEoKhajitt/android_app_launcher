# iriun_app_launcher for Android

This PowerShell script allows you to control the **iriun Webcam** app on your Android device via ADB. You can use it to either start the app, optionally with an automatic shutdown timer, or stop it and lock the device screen. The script wakes up the device if the screen is off and ensures that the app is running.  
This can also be used for other applications; just find and update the `$packageName` of the package you would like to stop or start.

## Prerequisites

- **ADB (Android Debug Bridge)**: Make sure ADB is installed and added to your system's PATH.
  - You can download it from [here](https://developer.android.com/studio/releases/platform-tools).
- **Android device** with developer options and USB debugging enabled.
- Ensure **iriun Webcam** is installed on your Android device.
- Ensure **iriun Webcam** is also installed on your PC.

## Script Overview

The script has two main functions:
- **Start iriun**: Wakes the device, unlocks the screen (if no passcode is set), and starts the iriun app. You can also specify an optional auto-shutdown timer.
- **Stop iriun**: Stops the iriun app if it's running and locks the device screen.

## Usage

You can use this script by passing either `start` or `stop` as an argument from the command line.

### Start iriun

To wake the device and start the iriun Webcam app:

```powershell
.\iriun.ps1 start
```

### Start iriun with autoShutdown
To start the iriun Webcam app and automatically stop it after a specified number of minutes:
```
.\iriun.ps1 start autoShutdown=5
```

### Stop iriun
To stop the iriun Webcam app and lock the device screen:
```powershell
.\iriun.ps1 stop
```

### Help Section
You can view available parameters and usage instructions by running:
```
.\iriun.ps1 --help
```
This will display information on how to use the start and stop commands, along with examples and details on the optional autoShutdown parameter.

### Notes
Ensure that your Android device is connected to your computer and recognized by ADB (adb devices).
This script assumes no passcode or fingerprint is required to unlock the device. If your device is locked with a passcode, you would need to manually unlock it.

### License
This script is provided "as is" without warranty of any kind. Use it at your own risk.
This does not modify the irium webcam application in any way and is only used to start the application on your android phone.  
[GPLv3](./LICENSE)

