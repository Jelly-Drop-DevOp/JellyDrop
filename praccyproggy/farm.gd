extends Node2D
@export var jellyTemplate: PackedScene
var spawncount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var inventory: Inventory = Inventory.load()
	for jelly_instance in inventory.owned_jellies:
		spawn_jelly(jelly_instance)
		spawncount = 0;

func _on_add_jelly_button_pressed() -> void:
	var inventory: Inventory = Inventory.load()
	var new_jelly_instance = BlueJelly.new("New name")
	inventory.owned_jellies.append(new_jelly_instance)
	inventory.save()
	spawn_jelly(new_jelly_instance)

func spawn_jelly(_jelly_instance: BlueJelly) -> void:
	var jelly = jellyTemplate.instantiate()
	jelly.position = $jellySpawn.next_spawnpoint()
	add_child(jelly)
