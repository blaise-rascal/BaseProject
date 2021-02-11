extends Node2D


#TO MAKE NEW ROOM:
#UILayer/CutscenePlayer
#Spawnpoint


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals._bound_camera_to_texturerect($YSort/Player/Camera2D,$Background)
	#if(Globals.NextSpawnpointName =="FromMeditationSpawn"):
	#	print("BLEH")
	#	$YSort/Player.position = $FromMeditationSpawn.position
	#else:
	#	print("ERROR")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
