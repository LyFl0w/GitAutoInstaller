@echo off
setlocal enabledelayedexpansion

set git_download_url=https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe

set git_repo_name=PortableGit

REM Installs a Portable version of Git if the user doesn't have Git installed
git --version >nul 2>&1
if not %errorlevel% equ 0 (
	REM Creating a directory for Git
	
	if not exist "%git_repo_name%" (
		
		REM Download 7z to extract PortableGit
		if not exist "./utils/7z.exe" (
			REM Télécharger 7z
			echo Installation de 7z
			powershell -File "./utils/install-7z.ps1"
			
			cls
		)
		
		mkdir %git_repo_name%
		
		REM Download and unzip Git
		echo Installation de Git
		powershell -File "./utils/install-git.ps1"
		
		cls
		
		call %git_repo_name%/post-install.bat
		cd ../
		
		cls
	)
)


REM Disable delayedexpansion extension
endlocal