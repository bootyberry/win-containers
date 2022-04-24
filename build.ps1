$ErrorActionPreference = "Stop"
$docker_repo = "bootyberry"
$container = $($args[0])


. ./$container/version.ps1
$imagename = ("{0}/{1}:{2}" -f $docker_repo, $container, $env:APP_VERSION)
$imagelatest = ("{0}/{1}:latest" -f $docker_repo, $container)

Write-Host "Building $imagename."
docker build --pull --build-arg APP_VERSION=$env:APP_VERSION -t $imagename -t $imagelatest ./$container

Write-Host "Pushing image to docker hub..."
docker push $imagelatest
docker push $imagename

Write-Host "Done."