extends Node

var length

func _ready():
	length = 0
	
func _process(delta: float) -> void:
	length += delta
	print("length is ", length)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		length = 0
