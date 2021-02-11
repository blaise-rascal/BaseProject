extends KinematicBody2D

const MOTION_SPEED = 600 # Pixels/second.

signal playnpccutscene(WhichCutsceneIndex)
#DONT FORGET TO CONNECT
func _ready():
	if(Globals.NextSpawnpointName != "SPAWNINPLACE"):
		#lmao
		#print(Globals.NextSpawnpointName)
		#print()
		position = get_parent().get_parent().get_node(Globals.NextSpawnpointName).position
	
	connect("playnpccutscene", get_parent().get_parent().get_node("UILayer/CutscenePlayer"), "play_cutscene")
	pass

func _physics_process(_delta):
	
	var motion = Vector2()
	if(Globals.CutsceneActive == false):
		motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	#warning-ignore:return_value_discarded
	#print(motion)
	if(motion == Vector2(0,0)):
		$CharAnims.play("idle")
	else:
		#motion = Vector2(maxspeed,0).rotated(velocity.angle())
		if(motion.x >0):
			$Sprite.flip_h=true
		else:
			$Sprite.flip_h=false
		$CharAnims.play("walk")

	move_and_slide(motion)
	


func _input(event):
	if event.is_action_pressed("ui_interact"):
		if(Globals.CurrentlyNear != null):
			if(Globals.CutsceneActive == false):
				emit_signal("playnpccutscene",Cutscenes.NPCCutscenes[Globals.CurrentlyNear.NPCIndex])
			#emit_signal(Globals.CurrentlyNear.InteractCutscene)
