extends Node2D




#If a dictionary moment contains "text", it will wait to progress to the next element until you've clicked through.
#If a dictionary contains "unskippable animation" then it will override 
#"text"
#"portrait"
#"concurrentanimation"
#"unskippableanimation"
#(play text dramatically)

# Called when the node enters the scene tree for the first time.
func _ready():
	$UILayer/CutscenePlayer/ColorBelowUI.visible = true
	$UILayer/CutscenePlayer/ColorBelowUI.color = Color(0,0,0,1)
	$UILayer/CutscenePlayer/ColorAboveUI.visible = false
	Globals._bound_camera_to_texturerect($CutsceneCamera,$MeditationRoom)
	Globals._bound_camera_to_texturerect($YSort/Player/Camera2D,$MeditationRoom)
	$UILayer/CutscenePlayer.play_cutscene(Cutscenes.OpeningCutscene)

