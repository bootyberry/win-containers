docker stop sabnzbd
docker rm sabnzbd
docker run -d `
    --hostname sabnzbd `
    --name sabnzbd `
    -v c:\services\sabnzbd:c:\config `
    -v c:\temp\downloads:c:\downloads `
    -p 8080:8080 `
    --pull=always `
    --restart=always `
bootyberry/sabnzbd:latest