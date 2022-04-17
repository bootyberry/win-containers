
$containers = @{
    tautulli = "https://api.github.com/repos/Tautulli/Tautulli/releases/latest";
    sonarr = "https://api.github.com/repos/sonarr/sonarr/tags";
    radarr = "https://api.github.com/repos/Radarr/Radarr/releases/latest";
    sabnzbd = "https://api.github.com/repos/sabnzbd/sabnzbd/releases/latest";
    ombi = "https://api.github.com/repos/Ombi-app/Ombi/releases/latest";
}

foreach ($container in $containers.GetEnumerator()) {
    $name = $($container.Name);
    $url = $($container.Value);
    Write-Host "Name: $name"
    Write-Host "Url: $url"

    . .\$name\version.ps1

    
    # Sonarr doesnt publish a release, so have to grab the latest tag instead
    $version = "0" # Reset version in case it fails so we dont update
    $version = if ($name -eq "sonarr") {
            $tag = (iwr $url|ConvertFrom-Json)[0].name
            $tag.Trim('v')
        } else {
            $tag = (iwr $url|ConvertFrom-Json).tag_name
            $tag.Trim('v')
        }

    Write-Host "Latest $name version is: $version"
    Write-Host "Current $name version is: $env:APP_VERSION"

    if ([version]$version -gt [version]$env:APP_VERSION) {
        Write-Host "Setting $name version..."
        New-Item -Path "./$name" -Name "version.ps1" -Value "`$env:APP_VERSION = `"$version`"" -Force | Out-Null
        . ./build.ps1 $name
    } else {
        Write-Host "No updates, skipping build..."
    }

    Write-Host ""
}

