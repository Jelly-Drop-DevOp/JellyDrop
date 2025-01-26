extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shop_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://shop.tscn")


func _on_farm_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://farm.tscn")


func _on_mixer_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://mixer/mixer.tscn")
