extends Node2D

var button_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameClock.tick.connect(_on_clock_tick)
	button_timer = -1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_clock_tick() -> void:
	
	$SignalPanel/SignalOutput.add_text("%s: %s\n" % ["button timer", button_timer])
	if(button_timer > 0):
		button_timer -= 1
	elif(button_timer > -1):
		button_timer -= 1
		$SignalPanel/SignalOutput.add_text("button timer up!~\n" )


#currently this just set sout timer to 2 seconds to be counted down.
#for testing this should crate a new object with its own timer.
#Object created by this button should count down and then delete themselves.
#Children should also output to the signaloutput just to make sure we can have many objects on the clock.
func _on_add_watcher_pressed() -> void:
	button_timer = 2
	pass # Replace with function body.
