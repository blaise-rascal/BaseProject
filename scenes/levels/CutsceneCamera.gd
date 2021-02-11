extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#export(NodePath) var playercam_node_path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _move_to_playercam(seconds : float):
	
	#LOOK UPON MY WORKS YE MIGHTY AND DESPAIR
	var PlayerCamera = get_parent().get_node("YSort/Player/Camera2D")
	print(position)
	print(PlayerCamera.position)
	$TweenToPlayer.interpolate_property(self, "position",
		null, PlayerCamera.global_position, seconds,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$TweenToPlayer.start()
