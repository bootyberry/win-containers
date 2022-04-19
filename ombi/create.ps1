docker pull bootyberry/ombi:latest
docker stop ombi
docker rm ombi
docker run -d `
    --hostname ombi `
    --name ombi `
    -v c:\services\ombi:c:\config `
    -p 5000:5000 `
    --restart=always `
bootyberry/ombi:latest