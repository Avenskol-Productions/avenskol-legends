extends Button

func _ready():
	connect("pressed", on_pressed)

func on_pressed():
	var dialogue: RichTextLabel = $"../MenuText/Dialogue"
	dialogue.text += "adding text\n"
	dialogue.on_option()
	return
	
