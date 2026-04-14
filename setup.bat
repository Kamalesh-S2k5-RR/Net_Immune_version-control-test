@echo off
echo ===================================================
echo Welcome to Net Immune Personal Edition Setup
echo ===================================================
echo.
echo Step 1: We need the Python Core Engine.
echo Opening the Microsoft Store...
echo.
echo PLEASE CLICK "GET" ON PYTHON 3.11 OR 3.12 IN THE STORE.
echo.

REM This line forces the Microsoft Store to open and search for Python
start ms-windows-store://search/?query=python

REM This line stops the script from moving forward until the user is ready
echo WHEN PYTHON IS FINISHED INSTALLING...
pause

echo.
echo Step 2: Creating Secure Virtual Environment...
echo.

REM 1. This creates the isolated .venv folder right next to your script
python -m venv "%~dp0.venv"

echo.
echo Step 3: Installing Security Modules...
echo.

REM 2. We use the specific python.exe inside the new .venv to install libraries!
"%~dp0.venv\Scripts\python.exe" -m pip install --upgrade pip
"%~dp0.venv\Scripts\python.exe" -m pip install -r "%~dp0requirements.txt"

echo.
echo Setup Complete! Starting Net Immune...
echo.

REM 3. Launch the App invisibly using the specific pythonw.exe from the .venv
start "" "%~dp0.venv\Scripts\pythonw.exe" "%~dp0main_app.py"