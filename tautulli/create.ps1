docker pull bootyberry/tautulli:latest
docker stop tautulli
docker rm tautulli
docker run -d `
    --hostname tautulli `
    --name tautulli `
    -v c:\services\tautulli:c:\config `
    -v "c:\services\plex\plex media server\logs":c:\plexlogs `
    -p 8080:8080 `
    --restart=always `
bootyberry/tautulli:latest