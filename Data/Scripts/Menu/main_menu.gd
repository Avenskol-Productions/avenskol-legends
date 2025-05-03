class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Play as Button
@onready var lore_button = $MarginContainer/HBoxContainer/VBoxContainer/Lore as Button
@onready var settings_button = $MarginContainer/HBoxContainer/VBoxContainer/Settings as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button
@onready var start_level = preload("res://Data/Scenes/Levels/level_GO.tscn") as PackedScene
@onready var settings_menu = $SettingsMenu as Settingsmenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	handle_signals()

func on_start_down():
	get_tree().change_scene_to_packed(start_level)
	print("Loading play menu")

func on_lore_down():
	print("Loading lore menu")
	pass

func on_settings_down():
	margin_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true
	print("Loading settings menu")

func on_exit_settings():
	margin_container.visible = true
	settings_menu.visible = false

func on_exit_down():
	get_tree().quit()

func handle_signals():
	start_button.button_down.connect(on_start_down)
	settings_button.button_down.connect(on_settings_down)
	exit_button.button_down.connect(on_exit_down)
	settings_menu.exit_settings.connect(on_exit_settings)
