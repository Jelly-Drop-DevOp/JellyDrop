extends Node2D
@export var mixer_list_entry_template: PackedScene

func _ready() -> void:
	var inventory: Inventory = Inventory.load()
	for jelly_instance in inventory.owned_jellies:
		add_jelly_list_entry(jelly_instance)

func add_jelly_list_entry(jelly_instance: BlueJelly) -> void:
	var mixer_list_entry = mixer_list_entry_template.instantiate()
	var button: Button = Button.new()
	button.text = "Test"
	$JellyListContainer/JellyList.add_child(button)
