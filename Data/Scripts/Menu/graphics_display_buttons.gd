extends Control

@onready var option_button = $HBoxContainer/WindowButton as OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Fullscreen",
	"Borderless Fullscreen",
	"Windowed",
	"Borderless Windowed"
]

func _ready():
	add_window_mode_items()

func add_window_mode_items():
	for window_mode in WINDOW_MODE_ARRAY:
			option_button.add_item(window_mode)

func on_window_mode_selected(index : int):
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Windowed Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		4: #Borderless Windowed Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
