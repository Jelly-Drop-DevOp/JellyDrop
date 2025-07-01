extends Node2D

func _on_shop_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://shop.tscn")


func _on_farm_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://farm.tscn")


func _on_mixer_transfer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://mixer/mixer.tscn")
