extends RichTextLabel

func _ready():
	connect("meta_clicked", $"../../Dialogue".add_t)
	on_option()
	return

func on_option():
	for i in range(1, 5):
		text += "[url]%d. %s[/url]\n" % [i, "Option"]
	return
