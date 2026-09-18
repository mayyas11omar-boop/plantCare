@echo off
cd /d "%~dp0backend_new"
echo Installing backend dependencies if needed...
call npm install
if %ERRORLEVEL% neq 0 (
  echo npm install failed. Check Node.js/npm installation.
  pause
  exit /b %ERRORLEVEL%
)
echo.
echo Starting Saffa Project backend...
echo Open: http://localhost:3000/login.html
echo.
node server.js
pause
