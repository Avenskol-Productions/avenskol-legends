extends RichTextLabel

func _ready():
	for _i in range(20):
		text += "\n"
	return

func on_option():
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	var scroll: ScrollBar = get_v_scroll_bar()
	var v: float = scroll.get_value()
	var m: float = scroll.get_max()
	tween.tween_method(scroll.set_value, v, m, 0.55)
	return

func add_t(t: String):
	on_option()
	return
