extends Node

var CurrentlyNear = null
var CutsceneActive = true
var gamehasbegun = false
var NextSpawnpointName = "SPAWNINPLACE"
#var Clickthrough = true
#var CurrentCutscene = ""
func _bound_camera_to_texturerect(PCamera : Camera2D, PTextureRect : TextureRect):
	PCamera.limit_left = PTextureRect.rect_position.x
	PCamera.limit_top = PTextureRect.rect_position.y
	PCamera.limit_right = PTextureRect.rect_size.x
	PCamera.limit_bottom = PTextureRect.rect_size.y


