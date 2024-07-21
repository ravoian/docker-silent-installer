:: -----------------------------------------------------------------
:: --- Configure directories
:: -----------------------------------------------------------------
set INSTALL_DIR="P:\Docker\Install"
set DATA_DIR="P:\\Docker\\Data"

:: -----------------------------------------------------------------
:: --- Enable required Windows features
:: -----------------------------------------------------------------
powershell -command "Enable-WindowsOptionalFeature -Online -FeatureName $('Microsoft-Hyper-V', 'Containers', 'Microsoft-Windows-Subsystem-Linux', 'VirtualMachinePlatform') -All"
curl "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" --output "Docker Desktop Installer.exe"

:: -----------------------------------------------------------------
:: --- Uninstall any pre-existing installation
:: -----------------------------------------------------------------
start /w "" "Docker Desktop Installer.exe" uninstall --quiet
rmdir "%APPDATA%\Roaming\Docker" /s /q
rmdir "%APPDATA%\Roaming\Docker Desktop" /s /q
rmdir "%APPDATA%\Local\Docker" /s /q

:: -----------------------------------------------------------------
:: --- Begin silent installation
:: -----------------------------------------------------------------
start /w "" "Docker Desktop Installer.exe" install --quiet --accept-license ^
 --backend=hyper-v --always-run-service --installation-dir=%INSTALL_DIR% ^
 --windows-containers-default-data-root=%DATA_DIR% --hyper-v-default-data-root=%DATA_DIR%

:: -----------------------------------------------------------------
:: --- Keep window open for review
:: -----------------------------------------------------------------
@pause