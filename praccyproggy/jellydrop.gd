extends Node2D

var dropcolor = Vector4()
var dropoutline = Vector4()
var valueTester

#dropcolor is a vec4 used to shade the texture for the drops set when innitially created only
#Called when the node enters the scene tree for the first time.
#devisionmaker should be depricated once we figure out where in the code we decide on jelly color

func _ready() -> void:
	var decisionMaker = randi() % 2
	
	if(decisionMaker == 1):
		dropcolor = Vector4(1, .984, .694, 1)
		dropoutline = Vector4(0.847, 0.773, 0.38, 1)
	if(decisionMaker == 0):
		dropcolor = Vector4(0.627, 0.8, 1.0, 1)
		dropoutline = Vector4(0.361, 0.588, 0.859, 1)
	$JellAi/JellyAnimations.set_dropcolor(dropcolor)
	$JellAi/JellyAnimations.set_dropoutline(dropoutline)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Camera2D.position = self.position
	pass
