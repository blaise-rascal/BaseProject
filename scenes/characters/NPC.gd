extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
#var TalkedTo = false
var PlayerNearby = false
export var NPCIndex :int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_InteractArea_body_entered(body):
	if(body.is_in_group("playergroup")):
		Globals.CurrentlyNear = self


func _on_InteractArea_body_exited(body):
	if(body.is_in_group("playergroup")):
		Globals.CurrentlyNear = null
