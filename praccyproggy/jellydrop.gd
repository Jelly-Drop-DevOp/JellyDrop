extends Node2D

var dropcolor = Vector4()
var valueTester

#dropcolor is a vec4 used to shade the texture for the drops set when innitially created only
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var decisionMaker = randi() % 2
	if(decisionMaker == 1):
		dropcolor = Vector4(1, .984, .694, 1)
	if(decisionMaker == 0):
		dropcolor = Vector4(0.627, 0.8, 1.0, 1)
	$JellAi/JellyAnimations.dropcolor = dropcolor
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
