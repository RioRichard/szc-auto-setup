function Invoke-GatherInformation {
    Write-Host "Gathering System Information..."
    # Placeholder for information gathering logic
    $computerName = $env:COMPUTERNAME
    $userName = $env:USERNAME
    Write-Host "Computer Name: $computerName"
    Write-Host "Current User: $userName"

    # Check for department information from environment variable
    if (-not $env:DEPARTMENT_NAME) {
        Write-Host "Department information not found. Launching Department Selection UI..."
        Show-DepartmentSelectionUi
    } else {
        Write-Host "Department information found: $($env:DEPARTMENT_NAME) (Code: $($env:DEPARTMENT_CODE))"
    }

    Start-Sleep -Seconds 2
    Write-Host "Information Gathering Complete."
}

Export-ModuleMember -Function Invoke-GatherInformation