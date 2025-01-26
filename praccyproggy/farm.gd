extends Node2D
@export var jellyTemplate: PackedScene
var spawncount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawncount = 0;
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_jelly_button_pressed() -> void:
	var jelly = jellyTemplate.instantiate()
	jelly.position = $jellySpawn.next_spawnpoint()
	add_child(jelly)
