@echo off

@rem Enable vendor-specific graphics APIs if the container is running with GPU acceleration
powershell -ExecutionPolicy Bypass -File ".\enable-graphics-api.ps1"

echo Restore Plex configuration
"C:\setup\DockerRegistrySync.exe" "C:\config\PlexConfig.json" "HKEY_CURRENT_USER\Software\Plex, Inc.\Plex Media Server" --restore

echo Plex will be running on:
ipconfig | findstr /c:IPv
echo Starting Plex
start "Registry sync" "C:\setup\DockerRegistrySync.exe" "C:\config\PlexConfig.json" "HKEY_CURRENT_USER\Software\Plex, Inc.\Plex Media Server"
"C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"