extends TextureRect
class_name DialogBox

"""
Will show a dialog box with the name of the character and
dialog text, two lines at a time. 
"""


var dialog_showing = false
var wait_on_input = true #TODO check if using
signal next_moment
#signal dialog_ended


#72 for 
#right now: 50 & 50 makes 100
var lines_to_skip = 0

func _ready():
	#connect("dialog_ended", get_parent(), "_dialog_ended")
	#connect("next_moment", get_parent(), "_on_next_moment")
	hide()
	pass # Replace with function body.

func show_unskippable_dialog(new_text):
	$dialog_text.visible_characters = 0
	$dialog_text.text = new_text
	$dialog_text.lines_skipped = 0
	dialog_showing = true
	$anims.play("show_unskippable_text")


#SHOW CLICKTHROUGH DIALOG
func show_clickthrough_dialog(new_text):
	$dialog_text.text = new_text
	
	lines_to_skip = 0
	$dialog_text.lines_skipped = lines_to_skip
	if(dialog_showing == false):
		dialog_showing = true
		$anims.play("appear")
	else:
		$anims.play("show_text")
		
		

#eurgh, am i gonna play this then stop it if there's no instruction 
func no_dialog_this_moment():
	if(dialog_showing == true):
		$anims.play("disappear")
		dialog_showing = false

func kill_dialog():
	dialog_showing = false
	visible = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		match $anims.assigned_animation:
			"show_text": 
				$anims.play("wait")
			"wait":
				lines_to_skip += 2
				if lines_to_skip < $dialog_text.get_line_count(): 
					$dialog_text.lines_skipped = lines_to_skip
					$anims.play("show_text")
				else:
					emit_signal("next_moment")
					
					
#TODO: Make show_text a tween (because we don't know how long it will take)
#At end of appear, run show text Tween
#instead of animsplayshowtext, run show text tween
#run 



#func _on_anims_animation_finished(anim_name):
#	if (anim_name == "show_unskippable_text"):
#		$dialog_text.visible_characters = 0
