# Create an installation path - the path where the file is going to go when downloaded from the web
$web_downloads = @(
    @{Name= "Adobe Acrobat"; FolderName= "Adobe"; URL="https://get.adobe.com/reader/"}
    @{Name= "VLC Media Player"; FolderName= "VideoLAN"; URL="https://www.videolan.org/vlc/download-windows.html"}
)
# download the paths from the web and put them where the installation path is going to be (i.e. Downloads) 
ForEach ($software in $web_downloads.GetEnumerator()) {
    $programFiles = "C:\Program Files\$($software.FolderName)"  # Used $software instead of @web_development
    $programFilesX86 = "C:\Program Files (x86)\$($software.FolderName)"
    
    If(!(Test-Path -Path $programFiles) -and !(Test-Path -Path $programFilesX86)) {
        Invoke-WebRequest -Uri $software.URL -OutFile "$Env:USERPROFILE\Downloads\$($software.Name).exe"
        Start-Process -FilePath "$Env:USERPROFILE\Downloads\$($software.Name).exe" -ArgumentList "/silent" -Wait # Ensure install starts after downloading
    } else {  # Else and If statements are usually on the same level in a loop
        Write-Output "$($software.Name) is already installed."            
    }

}
