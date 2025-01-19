extends Node2D

func _ready() -> void:
	var inventory: Inventory = Inventory.load()
	for jelly_instance in inventory.owned_jellies:
		add_jelly_list_entry(jelly_instance)

func add_jelly_list_entry(jelly_instance: BlueJelly) -> void:
	#TODO: tyleralbert - Instantiate custom UI element with `jelly_instance` fields.
	var button: Button = Button.new()
	button.text = "Test"
	$JellyListContainer/JellyList.add_child(button)
