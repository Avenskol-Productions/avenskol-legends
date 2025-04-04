extends Node3D

@export var cameras : Array[Camera3D]=[]

var camera_change
var current_index=0

func _ready():
	update_camera()

func _input(event):
	if event.is_action_pressed("change_camera"):
		toggle_camera()

func update_camera():
	for i in range(cameras.size()):
		cameras[i].current= (i == current_index)

func _on_change_camera_pressed():
	current_index=(current_index +1)% cameras.size()
	update_camera()

func toggle_camera():
	if camera_change == true:
		current_index=(current_index +1)% cameras.size()
