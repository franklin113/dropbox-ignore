

# Setup the context menu

Create two context menu entries:

1) Add two registry keys to HKEY_CLASSES_ROOT\Directory\shell\
    - Computer\HKEY_CLASSES_ROOT\Directory\shell\DropboxIgnore
    - Computer\HKEY_CLASSES_ROOT\Directory\shell\DropboxUnignore

2) Set the default values for these commands to be display names
    - Dropbox Ignore Folder
    - Dropbox Unignore Folder
3) Create sub-keys for each called "command" and set the value to the below commands

    - The command for the Ignore script should be:
      ```
      PowerShell.exe  -File "C:\automations\dropbox-ignore\ignore-directory.ps1" "%V"
      ```
    - The command for the Unignore script should be:

      ``` 
      PowerShell.exe -File "C:\automations\dropbox-ignore\unignore-directory.ps1" "%V"
      ```
