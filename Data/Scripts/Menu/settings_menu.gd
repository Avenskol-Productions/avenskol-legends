class_name Settingsmenu
extends Control

@onready var exit_button = $MarginContainer/exit_button as Button

signal exit_settings

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed():
	exit_settings.emit()
	set_process(false)
