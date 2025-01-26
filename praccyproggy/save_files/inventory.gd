# Represents all entities owned by the player.
class_name Inventory extends Resource

# TODO: tyleralbert - Use Jelly inheritance hierarchy.
@export var owned_jellies: Array[BlueJelly] = []

static func load() -> Inventory:
	var inventory: Inventory = ResourceLoader.load("res://save_files/inventory.tres")
	if inventory == null:
		ResourceSaver.save(Inventory.new([]), "res://save_files/inventory.tres")
		inventory = ResourceLoader.load("res://save_files/inventory.tres")

	return inventory

func save() -> void:
	ResourceSaver.save(self, "res://save_files/inventory.tres")

func _init(p_owned_jellies: Array[BlueJelly] = []):
	owned_jellies = p_owned_jellies
