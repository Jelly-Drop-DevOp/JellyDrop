extends Node2D
@export var jellyTemplate: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_jelly_button_pressed() -> void:
	var jelly = jellyTemplate.instantiate()
	jelly.position = $jellySpawn.position
	add_child(jelly)
	##jelly.global_position = $jellySpawn
	print("buttonpressed")
