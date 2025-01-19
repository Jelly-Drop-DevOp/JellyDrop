extends AnimatedSprite2D

var dropcolor = Vector4()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	self.material.set_shader_parameter("dropcolor", dropcolor)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
