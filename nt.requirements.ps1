Write-Host "Installing requirements..."
# .NET Core 3.1 Installation
#Invoke-WebRequest -Uri "https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1" -OutFile "$env:TEMP\dotnet-install.ps1"
#& "$env:TEMP\dotnet-install.ps1" -Version 3.1.110
#& "$env:TEMP\dotnet-install.ps1" -Runtime dotnet -Version 3.1.32
#& "$env:TEMP\dotnet-install.ps1" -Runtime dotnet -Version 6.0.0
#& "$env:TEMP\dotnet-install.ps1" -Channel 3.1
# .NET Core 3.1 Installation
try {
    $installedPrograms = Get-WmiObject -Query "Select * from Win32_Product" | Where-Object { $_.Name -like "*Microsoft .NET Core Runtime - 3.1.32*" }
    if (-not $installedPrograms) {
    # Installation
        Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/476eba79-f17f-49c8-a213-0f24a22cd026/37c02de81ff5b76ac57a5427462395f1/dotnet-runtime-3.1.32-win-x64.exe" -OutFile "$env:TEMP\runtime-aspnetcore-3.1.32-windows-x64-installer.exe"
        Start-Process -FilePath "$env:TEMP\runtime-aspnetcore-3.1.32-windows-x64-installer.exe" -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait
        Write-Host ".NET Runtime 3.1.32:  installed." -ForegroundColor Green
    } else {
        Write-Host ".NET Runtime 3.1.32: is already installed." -ForegroundColor Green
    }
}
    catch {
        Write-Host ".NET Runtime 3.1.32: failed" -ForegroundColor Red
    }

#Microsoft ASP.NET Core 3.1.32 Shared Framework
try {
    $installedPrograms = Get-WmiObject -Query "Select * from Win32_Product" | Where-Object { $_.Name -like "*Microsoft ASP.NET Core 3.1.32 Shared*" }
    if (-not $installedPrograms) {
        #  Installation
        Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/98910750-2644-472c-ab2b-17f315ccb953/c2a4c223ee11e2eec7d13744e7a45547/aspnetcore-runtime-3.1.32-win-x64.exe" -OutFile "$env:TEMP\runtime-aspnetcore-3.1.32-windows-x64-installer.exe"
        Start-Process -FilePath "$env:TEMP\runtime-aspnetcore-3.1.32-windows-x64-installer.exe" -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait
        Write-Host "ASP.NET Core Runtime 3.1.32 - Shared Framework:  installed." -ForegroundColor Green
    } else {
        Write-Host "ASP.NET Core Runtime 3.1.32 - Shared Framework: is already installed." -ForegroundColor Green
    }
}
catch {
    Write-Host "ASP.NET Core Runtime 3.1.32 - Shared Framework: failed" -ForegroundColor Red
}

# vcredist_x64 (Visual C++)
try {
    $installedPrograms = Get-WmiObject -Query "Select * from Win32_Product" | Where-Object { $_.Name -like "*Microsoft Visual C++ 2022 X64*" }
    if (-not $installedPrograms) {
        # vcredist_x64 Visual C++ Installation
        Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "$env:TEMP\vcredist_x64.exe"
        Start-Process -FilePath "$env:TEMP\vcredist_x64.exe" -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait
        Write-Host "Visual C++ 2022: installed." -ForegroundColor Green
    } else {
        Write-Host "Visual C++ 2022: is already installed." -ForegroundColor Green
    }
}
catch {
    Write-Host "Visual C++ 2022: failed" -ForegroundColor Red
}


# vcredist_x64 (Visual Studio 2013)
try {
    $installedPrograms = Get-WmiObject -Query "Select * from Win32_Product" | Where-Object { $_.Name -like "*Microsoft Visual C++ 2013 x64*" }
    if (-not $installedPrograms) {
        # vcredist_x64 (Visual Studio 2013 (VC++12.0)) Installation
        Invoke-WebRequest -Uri "https://download.microsoft.com/download/0/5/6/056dcda9-d667-4e27-8001-8a0c6971d6b1/vcredist_x64.exe" -OutFile "$env:TEMP\vcredist_x64.exe"
        Start-Process -FilePath "$env:TEMP\vcredist_x64.exe" -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait
        Write-Host "Visual C++ 2013: installed" -ForegroundColor Green
    } else {
        Write-Host "Visual C++ 2013: is already installed." -ForegroundColor Green
    }
}
catch {
    Write-Host "Visual C++ 2013: failed" -ForegroundColor Red
}