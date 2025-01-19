extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_toggle_pressed() -> void:
	if($JellyDropMidi.is_playing()):
		$JellyDropMidi.stop()
	else:
		$JellyDropMidi.play()
	pass # Replace with function body.
