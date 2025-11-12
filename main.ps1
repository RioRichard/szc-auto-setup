# main.ps1

# Define the path to the modules directory
$modulePath = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Definition) "src"

# Import modules
Import-Module (Join-Path $modulePath "CliUi.psm1")
Import-Module (Join-Path $modulePath "GatherInformation.psm1")
Import-Module (Join-Path $modulePath "SoftwareSetup.psm1")
Import-Module (Join-Path $modulePath "PrinterSetup.psm1")
Import-Module (Join-Path $modulePath "DepartmentSelectionUi.psm1")

function Main {
    while ($true) {
        $choice = Show-MainMenu
        $continue = Invoke-MenuAction -Choice $choice
        if (-not $continue) {
            break
        }
        Write-Host "" # Add a blank line for readability
    }
}

# Run the main function
Main