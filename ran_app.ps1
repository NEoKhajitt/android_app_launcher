# $env:Path += ";C:\data\android-launcher\platform-tools"

# Function to start the iRium app
function Start-Irium {
    $packageName = "com.jacksoftw.webcam" # iRium package name on Android

    Write-Host "Waking up the device..."
    adb shell input keyevent 26 # Power button toggle
    Start-Sleep -Seconds 1
    adb shell input keyevent 82 # Unlock the device

    Write-Host "Checking if iRium is running..."
    $checkRunning = adb shell ps | Select-String $packageName

    if ($checkRunning) {
        Write-Host "iRium is already running."
    } else {
        Write-Host "iRium is not running, starting it now..."
        adb shell monkey -p $packageName 1
        Write-Host "iRium started."
    }
}

# Function to stop the iRium app and lock the screen
function Stop-Irium {
    $packageName = "com.jacksoftw.webcam" # iRium package name on Android

    Write-Host "Stopping iRium if it's running..."
    adb shell am force-stop $packageName
    Write-Host "iRium process stopped."

    Write-Host "Locking the screen..."
    adb shell input keyevent 26 # Power button toggle to turn off the screen
    Write-Host "Device locked."
}

# Main logic with command-line argument
if ($args.Count -eq 0) {
    Write-Host "No argument provided. Please use 'start' or 'stop'."
    exit
}

$action = $args[0]

if ($action -eq "start") {
    Start-Irium
} elseif ($action -eq "stop") {
    Stop-Irium
} else {
    Write-Host "Invalid argument. Please use 'start' or 'stop'."
}
