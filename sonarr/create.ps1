# sonarr was causing BSOD in process isolation on ltsc2022
# when accessing network shares on my server
# launch in hyperv isolation mode for now
docker stop sonarr
docker rm sonarr
docker run -d `
    --hostname sonarr `
    --isolation=hyperv `
    --name sonarr `
    --security-opt "credentialspec=file://fallendusk_sonarr.json" `
    -v c:\services\sonarr:c:\config `
    -v d:\temp\downloads:c:\downloads `
    -p 8989:8989 `
    --pull=always `
    --restart=always `
bootyberry/sonarr:latest