extends Area2D

export(String, FILE, "*.tscn") var NextRoom = ""
#export var NextRoom : String = ""
export var NextSpawnpoint : String = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_ExitArea_body_entered(body):
	if(body.is_in_group("playergroup")):
		#print("TRANSITION TO " + str(NextRoom))
		Globals.NextSpawnpointName = NextSpawnpoint
		get_tree().change_scene(NextRoom)

