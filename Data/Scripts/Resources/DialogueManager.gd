class_name Point
extends  Resource

enum Type { DEPOT, STATION, SPEED}

@export var _type: Type = Type.STATION : get = get_type
@export var _stationName: String = "Manchester" : get = get_point_name
@export var _distance: int = 500 : get = get_distance
@export var _icon: CompressedTexture2D : get = _get_icon
@export var _dialogue: Dictionary = {
	"Intro" : {
		"Dialogue": "test test",
		"Choices": ["Continue"],
	},
	"Intro1" : {
		"Dialogue": "Again test",
		"Choices": ["a", "b", "c"],
	},
	"a" : {
		"Dialogue": "A test",
		"Choices": ["End"],
	},
	"b" : {
		"Dialogue": "B test",
		"Choices": ["End"],
	},
	"c" : {
		"Dialogue": "C test",
		"Choices": ["End"],
	}
} : get = get_dialogue

func get_type() -> Type:
	return _type

func get_point_name() -> String:
	return _stationName

func get_distance() -> int:
	return _distance

func _get_icon() -> CompressedTexture2D:
	return _icon

func get_dialogue() -> Dictionary:
	return _dialogue
