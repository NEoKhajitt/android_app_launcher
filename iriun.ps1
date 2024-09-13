# $env:Path += ";C:\data\Code\NM\iriun_app_launcher\platform-tools"
# Function to display help information
function Show-Help {
    Write-Host "Usage: .\iriun.ps1 [start|stop] [autoShutdown=<minutes>]"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  start               Starts the iRium app on your Android device."
    Write-Host "  stop                Stops the iRium app and locks the Android device."
    Write-Host ""
    Write-Host "Optional Parameters:"
    Write-Host "  autoShutdown=<minutes>   Automatically shuts down the iRium app after the specified number of minutes."
    Write-Host "                           If autoShutdown is 0 or not provided, the app will not shut down automatically."
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  .\iriun.ps1 start                 # Starts iRium without auto-shutdown."
    Write-Host "  .\iriun.ps1 start autoShutdown=5  # Starts iRium and shuts it down after 5 minutes."
    Write-Host "  .\iriun.ps1 stop                  # Stops iRium and locks the Android device."
    exit
}

# Function to start the iRium app
function Start-Irium {
    param (
        [int]$autoShutdown = 0
    )

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

    if ($autoShutdown -gt 0) {
        Write-Host "Auto shutdown enabled. iRium will stop in $autoShutdown minutes."
        Start-Sleep -Seconds ($autoShutdown * 60)
        Stop-Irium
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
if ($args.Count -eq 0 -or $args[0] -eq "--help") {
    Show-Help
}

$action = $args[0]

# Parse autoShutdown argument if provided
$autoShutdown = 0
foreach ($arg in $args) {
    if ($arg -match '^autoShutdown=(\d+)$') {
        $autoShutdown = [int]$matches[1]
    }
}

if ($action -eq "start") {
    Start-Irium -autoShutdown $autoShutdown
} elseif ($action -eq "stop") {
    Stop-Irium
} else {
    Write-Host "Invalid argument. Please use 'start' or 'stop' or '--help' for usage information."
}
