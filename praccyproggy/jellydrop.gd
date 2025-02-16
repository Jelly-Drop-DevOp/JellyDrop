extends Node2D

var dropcolor = Vector4()
var dropoutline = Vector4()
var valueTester
var draggable = false;
var offset = 0;

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
	$JellAi.position = position
	position = Vector2(0.0,0.0)



func stats() -> void:
	print("global jelly ai pos:",to_global($JellAi.position))
	print("jellypos:",global_position)
	print("colors (dropcolor;dropoutline):", dropcolor, dropoutline)
	print("busy timer: ", $JellAi.busytimer)
	print("velocity: ", $JellAi.velocity)
	print("busy timer: ", $JellAi.busyTimer)
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if Geometry2D.is_point_in_circle(event.position, to_global($JellAi.position), $JellAi/JellyCollision.shape.radius):
				$JellAi.offset = get_global_mouse_position() - to_global($JellAi.position)
				$JellAi.draggable = true
		else:
			$JellAi.draggable = false
		##if Geometry2D.is_point_in_polygon(event.position, $JellAi/JellyCollision.get_shape()):
