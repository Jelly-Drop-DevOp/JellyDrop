extends Button
@export var Drop: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var drop = Drop.instantiate()
	drop.position = get_global_mouse_position()
	add_child(drop)
	pass # Replace with function body.
