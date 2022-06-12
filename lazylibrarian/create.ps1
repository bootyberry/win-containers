docker stop lazylibrarian
docker rm lazylibrarian
docker run -d `
    --hostname lazylibrarian `
    --name lazylibrarian `
    -v c:\services\lazylibrarian:c:\config `
    -v d:\temp\downloads:c:\downloads `
    -v "d:\onedrive\onedrive - fallendusk\Books:c:\books" `
    -v W:\AudioBooks:C:\audiobooks `
    -p 5299:5299 `
    --pull=always `
    --restart=always `
bootyberry/lazylibrarian:latest