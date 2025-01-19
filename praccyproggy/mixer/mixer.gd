extends Node2D

@export var jelly_list_entry_template: PackedScene
@export var jelly_entry_markers: Array[Marker2D]
@export var left_cup: Marker2D
@export var right_cup: Marker2D
@export var result: Marker2D

func _ready() -> void:
	var inventory: Inventory = Inventory.load()
	for jelly_instance in inventory.owned_jellies:
		add_jelly_list_entry(jelly_instance)

func add_jelly_list_entry(jelly_instance: BlueJelly) -> void:
	var inventory: Inventory = Inventory.load()
	for i in range(0, min(jelly_entry_markers.size(), inventory.owned_jellies.size())):
		# TODO: tyleralbert - Populate jelly with data from jelly_instance.
		var jelly_list_entry = jelly_list_entry_template.instantiate()
		jelly_list_entry.position = jelly_entry_markers[i].position
		add_child(jelly_list_entry)
