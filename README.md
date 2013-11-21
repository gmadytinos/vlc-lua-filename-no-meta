vlc-lua-filename-no-meta
========================

This LUA script can be used to revert VLC's default behaviour for populating playlist track Titles to that approximating an earlier version. Some people prefer VLC not to use the file's metadata in order to populate the Title in the playlist but rather to use structured filenames only. 

Instructions
============

1. Locate the lua\meta\reader subfolder of your VLC installation.

By default on Windows 7 that would be here:
C:\Program Files (x86)\VideoLAN\VLC\lua\meta\reader

2. Make a backup copy of the existing filename.luac file that is located in that folder. Make sure that the backup copy is outside of the VLC installation entirely.

3. Simply copy the new filename.luac file into that folder, overwriting the old one.
