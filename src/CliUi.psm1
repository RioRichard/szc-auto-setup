$Script:MenuOptions = @(
    @{ Number = "1"; Description = "Gather Information"; Action = { Invoke-GatherInformation } },
    @{ Number = "2"; Description = "Software Setup"; Action = { Invoke-SoftwareSetup } },
    @{ Number = "3"; Description = "Printer Setup"; Action = { Invoke-PrinterSetup } },
    @{ Number = "4"; Description = "Department Selection UI"; Action = { Show-DepartmentSelectionUi } },
    @{ Number = "5"; Description = "Exit"; Action = { return $false } } # Special action for exit
)

function Show-MainMenu {
    [string]$choice = ""
    do {
        Clear-Host
        Write-Host "`n=========================================" -ForegroundColor Cyan
        Write-Host "  Windows PC Auto Setup Tool - Main Menu " -ForegroundColor Green
        Write-Host "=========================================`n" -ForegroundColor Cyan
        Write-Host "Please select an option:"
        foreach ($option in $Script:MenuOptions) {
            Write-Host "$($option.Number). $($option.Description)"
        }
        $choice = Read-Host "Enter your choice"

        if (-not ($Script:MenuOptions | Where-Object { $_.Number -eq $choice })) {
            Write-Host "Invalid choice. Please enter a number from the list." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    } while (-not ($Script:MenuOptions | Where-Object { $_.Number -eq $choice }))
    return $choice
}

function Invoke-MenuAction {
    param (
        [string]$Choice
    )

    $selectedOption = $Script:MenuOptions | Where-Object { $_.Number -eq $Choice }

    if ($selectedOption) {
        if ($selectedOption.Description -eq "Exit") {
            Write-Host "Exiting the tool. Goodbye!" -ForegroundColor Yellow
            return $false # Indicate that the tool should exit
        } else {
            & $selectedOption.Action # Invoke the associated action
            return $true # Indicate that the tool should continue
        }
    } else {
        # This block should ideally not be reached due to the do-while loop in Show-MainMenu
        Write-Host "An unexpected error occurred with menu selection." -ForegroundColor Red
        return $true # Continue to main menu
    }
}

Export-ModuleMember -Function Show-MainMenu, Invoke-MenuAction
