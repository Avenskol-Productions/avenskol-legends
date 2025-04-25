class_name HotkeyRebindButton
extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button
@export var action_name : String = "move_left"

func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() -> void:
	label.text = "unassigned"
	match action_name:
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"move_front":
			label.text = "Move Forward"
		"move_ur":
			label.text = "move northeast"
		"move_ul":
			label.text = "move northwest"
		"move_back":
			label.text = "Move Back"
		"move_lr":
			label.text = "move southeast"
		"move_ll":
			label.text = "move southwest"
		"jump":
			label.text = "Jump"
		"exit":
			label.text = "Exit"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	if action_events.size() > 0:
		var action_event = action_events[0]
		var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
		button.text = "%s" % action_keycode
	else:
		button.text = "No key assigned"

func _on_button_toggled(toggled_on):
	if toggled_on:
		button.text = "Rebinding"
		set_process_unhandled_key_input(true)
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		set_text_for_key()

func _unhandled_key_input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		rebind_action_key(event)
		button.set_pressed_no_signal(false)  # Use this method to set the button state without emitting the signal
	
func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()
	reset_buttons()

func reset_buttons():
	for i in get_tree().get_nodes_in_group("hotkey_button"):
		i.button.toggle_mode = true
		i.set_process_unhandled_key_input(false)
