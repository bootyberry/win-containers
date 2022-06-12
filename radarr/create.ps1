# radarr was causing BSOD in process isolation on ltsc2022
# when accessing network shares on my server
# launch in hyperv isolation mode for now
docker stop radarr
docker rm radarr
docker run -d `
    --hostname radarr `
    --isolation=hyperv `
    --name radarr `
    --security-opt "credentialspec=file://fallendusk_radarr.json" `
    -v c:\services\radarr:c:\config `
    -v d:\temp\downloads:c:\downloads `
    -p 7878:7878 `
    --pull=always `
    --restart=always `
bootyberry/radarr:latest