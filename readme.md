
# Overview
Dropbox allows you to ignore certain files and folders from beind synced. In most development environments we deal with directories containing thousands of files that can create a bottleneck in a development pipeline.  What we will achieve here is an approach to ignoring folders that should not be added to the remote dropbox folder. 

### Example
When working with nodejs we'll often install hundreds of packages via npm which can add up to be many MBs of files. Not only is it heavy on storage, these all also need to be synced for every user who has access to this folder, whether they are working on that particular folder or not.  By using the dropbox ignore, we can keep the node_modules folder LOCAL ONLY. 

# Setup

## The Script
Clone this repo and put it somewhere easy to find. "c:\automations\dropbox-ignore" will be used for the samples below.

## Setup the context menu

Creating a context menu item involves adding registry keys to ```HKEY_CLASSES_ROOT\Directory\shell```
The keys within this are what generates the dropdown menu found in windows.

### Create two context menu entries:

1) Add two registry keys to ```HKEY_CLASSES_ROOT\Directory\shell\```
    - ```Computer\HKEY_CLASSES_ROOT\Directory\shell\DropboxIgnore```
    - ```Computer\HKEY_CLASSES_ROOT\Directory\shell\DropboxUnignore```

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

### Run the script
Right click on a test folder that is currently synced to dropbox. You should see a green checkbox on the bottom left of the folder icon.  Click the "Dropbox Ignore Folder" item. A powershell prompt should popup briefly and close, showing that it's running. After a moment, the green sync icon should be replaced by a gray minus sign icon.