# Create an installation path - the path where the file is going to go when downloaded from the web
$web_downloads = @(
    @{Name= "Adobe Acrobat"; FolderName= "Adobe"; URL="https://get.adobe.com/reader/"}
    @{Name= "VLC Media Player"; FolderName= "VideoLAN"; URL="https://www.videolan.org/vlc/download-windows.html"}
)
# download the paths from the web and put them where the installation path is going to be 
ForEach ($software in $web_downloads.GetEnumerator()) {
    $programFiles = "C:\Program Files\$($web_downloads.FolderName)"
    $programFilesX86 = "C:\Program File (x86)\$($web_downloads.FolderName)"
    
    If(!(Test-Path -Path $programFiles) -and !(Test-Path -Path $programFilesX86)) {
        Invoke-WebRequest -Uri $software.URL -OutFile "$Env:USERPROFILE\Downloads"
            $installPath = "$Env:USERPROFILE\Downloads\$($software.Name).exe"
        else {
            Write-Output "$($software.Name) is already installed."            
        }
    }
    
    & 



}
# Make a secure install if to seek if the file is not yet in the system, install it then - if it is in the system Write-Out "already on windows"

# installing the files