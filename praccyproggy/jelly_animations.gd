extends AnimatedSprite2D

var dropcolor = Vector4()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func set_dropcolor(color: Vector4) -> void:
	self.material.set_shader_parameter("dropcolor", color)
	$JellyShine.material.set_shader_parameter("dropcolor", Vector4(color.w + .1, color.x + .1, color.y + .1, color.z))
	pass

func set_dropoutline(color: Vector4) -> void:
	$JellyLineart.material.set_shader_parameter("dropcolor", color)
	pass
