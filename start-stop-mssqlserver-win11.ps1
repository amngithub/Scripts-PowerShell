# Define the services to manage
$services = @(
    "MSSQLSERVER",        # SQL Server Database Engine
    "SQLSERVERAGENT",     # SQL Server Agent
    "SQLBrowser"          # SQL Server Browser
)

# Function to stop services
function Stop-SQLServices {
    foreach ($service in $services) {
        Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
        Write-Output "Stopped service: $service"
    }
}

# Function to start services
function Start-SQLServices {
    foreach ($service in $services) {
        Start-Service -Name $service -ErrorAction SilentlyContinue
        Write-Output "Started service: $service"
    }
}

# Main script
param (
    [string]$action = "stop"  # Default action is to stop services
)

if ($action -eq "stop") {
    Stop-SQLServices
} elseif ($action -eq "start") {
    Start-SQLServices
} else {
    Write-Output "Invalid action. Use 'start' or 'stop'."
}
