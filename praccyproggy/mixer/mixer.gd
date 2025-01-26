class_name Mixer extends Node2D

@export var mixer_jelly_tile_template: PackedScene
@export var jelly_entry_markers: Array[Marker2D]

@export var left_cup: Node2D
var left_cup_selected: bool = false
@export var right_cup: Node2D
var right_cup_selected: bool = false
@export var mix_tile: Node2D

@export var result: Marker2D

var selected_tile: Node2D = null
var left_cup_jelly = null
var right_cup_jelly = null

func _ready() -> void:
	var inventory: Inventory = Inventory.load()
	for jelly_instance in inventory.owned_jellies:
		add_jelly_list_entry(jelly_instance)
	left_cup.get_node("CharacterBody2D").connect("input_event", self._on_left_cup_input)
	right_cup.get_node("CharacterBody2D").connect("input_event", self._on_right_cup_input)
	mix_tile.get_node("CharacterBody2D").connect("input_event", self._on_mix_tile_input)

func add_jelly_list_entry(jelly_instance: BlueJelly) -> void:
	for marker in jelly_entry_markers:
		if marker.get_child_count() > 0:
			continue

		var tile: Node2D = mixer_jelly_tile_template.instantiate()
		marker.add_child(tile)
		var body: CharacterBody2D = tile.get_node("CharacterBody2D")
		body.connect("input_event", self._on_jelly_list_entry_input.bind(tile, jelly_instance))
		return

	print("Unable to populate jelly list entry for jelly: " + jelly_instance.name)

func _on_left_cup_input(viewport: Viewport, event: InputEvent, shape_idx: int):
	if !event.is_pressed():
		return

	if left_cup_selected:
		left_cup.scale = Vector2(1, 1)
	else:
		left_cup.scale = Vector2(0.8, 0.8)
		
	var node = left_cup.get_node("MixerJellyTile")
	if node != null:
		left_cup.remove_child(node)
		left_cup_jelly = null
		
	left_cup_selected = !left_cup_selected
	
func _on_right_cup_input(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if !event.is_pressed():
		return

	if right_cup_selected:
		right_cup.scale = Vector2(1, 1)
	else:
		right_cup.scale = Vector2(0.8, 0.8)
	var node = right_cup.get_node("MixerJellyTile")
	if node != null:
		right_cup.remove_child(node)
		right_cup_jelly = null
		
	right_cup_selected = !right_cup_selected

func _on_jelly_list_entry_input(_viewport: Viewport, event: InputEvent, _shape_idx: int, _clicked_tile: Node2D, jelly_instance: BlueJelly):
	if !event.is_pressed():
		return

	if right_cup_selected:
		var tile: Node2D = mixer_jelly_tile_template.instantiate()
		right_cup.add_child(tile)
		right_cup_jelly = jelly_instance
		right_cup.scale = Vector2(1, 1)
		right_cup_selected = false
		return	
	
	if left_cup_selected:
		var tile: Node2D = mixer_jelly_tile_template.instantiate()
		left_cup.add_child(tile)
		left_cup_jelly = jelly_instance
		left_cup.scale = Vector2(1, 1)
		left_cup_selected = false
		return

func _on_mix_tile_input(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if !event.is_pressed():
		return

	if left_cup_jelly == null or right_cup_jelly == null:
		return

	# TODO: tyleralbert - Base new jelly off of parent jellies.
	var inventory: Inventory = Inventory.load()
	var new_jelly_instance = BlueJelly.new("Mixer jelly")
	inventory.owned_jellies.append(new_jelly_instance)
	inventory.save()
	add_jelly_list_entry(new_jelly_instance)
