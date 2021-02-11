
extends AnimationPlayer


#Add cutscenes to 
var CurrentCutscene: Array
var CurrentMoment: int = 0
var unskippable = false

# Declare member variables here. Examples:
#var position = 0
# var b = "text"
#var position = 0
#var end = 0
#var dialogs = ["Breathe.",\
#"Breathe in all the things you know. Hold onto them.",\
#"Breathe out. Let them go. They change and are undone.",\
#"Breathe in the world.",\
#"Breathe it out.",\
#"You are all that is and will be. You are everything and nothing. And in this meditation, you - ",\
##(Title card: The southern air temple. meditation room b)
#"Master Gyatso!",\
#"Chi-Yu! to what do we owe the pleasure?",\
#"The Fire Nation is in the foothills! They'll be at our gates soon!",\
#"Well, we knew they were coming, Chi-Yu.",\
#"We have to do something!",\
#"We will, in due time. For now, care to join us in meditation?",\
#"How can you just sit there? They've been imprisoning anyone they like, and killing the rest! We have to get ready!",\
#"Listen. I know this is hard for you to understand. But this right here - meditation - is HOW we get ready. They cannot imprison us if our minds are free. When they get here, we'll fight or we'll flee - but we cannot continue with our lives as we have done so until now. Change is inevitable.",\
#"You and your mantras. If you really believed that \"change is inevitable,\" you wouldn't be meditating right now like you do every day! I'm going to try to talk to Zhelan. He should have some sense - unlike you!",\
#"Chi-Yu, it is wise to question your teachers. (smiling.)",\
#"Students, it appears that Chi-Yu will not be joining us. Let's resume our practice. Breathe in. breathe out..."]
#
## Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#stopfromprogressing


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play_cutscene(CutsceneToPlay: Array):
	Globals.CutsceneActive=true
	#CurrentCutscene = CutsceneToPlay.values()
	CurrentCutscene = CutsceneToPlay
	#get_tree().paused = true
	CurrentMoment = 0
	_play_current_moment()

#func scd(dialog):
#	#Globals.clickthrough = true
#	stop(false)#pauses the animation
#	print(get_current_animation_position())
#	$Dialog_box.show_clickthrough_dialog(dialog)
#



func _play_current_moment():
	if(CurrentCutscene[CurrentMoment].has("text")):
		unskippable = false
		$Dialog_box.show_clickthrough_dialog(CurrentCutscene[CurrentMoment]["text"])
	elif(CurrentCutscene[CurrentMoment].has("unskippable_animation")):
		unskippable = true
		play(CurrentCutscene[CurrentMoment]["unskippable_animation"])
	#elif():
		
	else:
		$Dialog_box.no_dialog_this_moment()
	#TODO: Come up with animationhandling & nonclickthrough dialog handling
	
func _on_Dialog_box_next_moment():
	CurrentMoment = CurrentMoment + 1
	if (CurrentMoment == CurrentCutscene.size()):
		Globals.CutsceneActive = false
		print("GOT HERE")
		#get_tree().paused = false
		$Dialog_box.no_dialog_this_moment()
	else :
		_play_current_moment()
	#play(CurrentCutscene,-1,1)
	#seek(ceil(get_current_animation_position()),true)
	#position = position + 1
	#_play_moment(position)
	#if (position == end):
	#	$Dialog_box.stop_dialogin()
	#else:
	#	$Dialog_box.show_clickthrough_dialog(dialogs[position])


func _on_CutscenePlayer_animation_finished(anim_name):
	if(unskippable == true):
		$Dialog_box/dialog_text.visible_characters = 0
		_on_Dialog_box_next_moment()


