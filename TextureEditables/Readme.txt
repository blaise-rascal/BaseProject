Double-click on AutoExportSprites.bat to export all sprites.
That script will search through several folders in this directory for files ending in .ase or .aseprite, and export them to an output folder.
By default, all sprites are exported at 4x scale, but that can be modified in AutoExportSprites.bat.
Note that the script will create folders and overwrite files as needed, but it will not clear the folder first.
What this means is that you may need to manually delete the ExportedTextures folder from time to time, to clear out textures from files that no longer exist.


Sprites in the folder simple-sprites will be flattened and exported.
Sprites in the folder sprite-sheets will be exported as a horizontal sheet with all frames.
Sprites in the folder by-group will be split into individual layer groups, then each group exported individually.
Sprites in the folder no-scale will be flattened and exported - and will be exported at 1:1 scaling
Sprites in the folder not-for-export (or anywhere else) will not be exported.
