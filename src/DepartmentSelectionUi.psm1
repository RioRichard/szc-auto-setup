$Script:Departments = @(
    @{ Id = "1"; Name = "Sales"; Code = "SAL" },
    @{ Id = "2"; Name = "Marketing"; Code = "MKT" },
    @{ Id = "3"; Name = "Engineering"; Code = "ENG" },
    @{ Id = "4"; Name = "Human Resources"; Code = "HR" }
)

function Show-DepartmentSelectionUi {
    [string]$choice = ""
    do {
        Write-Host "`n=========================================" -ForegroundColor Cyan
        Write-Host "  Department Selection UI                " -ForegroundColor Green
        Write-Host "=========================================`n" -ForegroundColor Cyan
        Write-Host "Please select your department:"

        foreach ($dept in $Script:Departments) {
            Write-Host "$($dept.Id). $($dept.Name)"
        }

        $choice = Read-Host "Enter your choice"
        $selectedDepartment = $Script:Departments | Where-Object { $_.Id -eq $choice }

        if ($selectedDepartment) {
            $env:DEPARTMENT_NAME = $selectedDepartment.Name
            $env:DEPARTMENT_CODE = $selectedDepartment.Code
            Write-Host "`nYou selected Department: $($selectedDepartment.Name) (Code: $($selectedDepartment.Code))" -ForegroundColor Green
            Write-Host "Department information stored in environment variables." -ForegroundColor Green
        } else {
            Write-Host "Invalid choice. Please enter a number from the list." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    } while (-not $selectedDepartment)
    Write-Host "`n-----------------------------------------" -ForegroundColor Cyan
}

Export-ModuleMember -Function Show-DepartmentSelectionUi
