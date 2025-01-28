extends CharacterBody2D
var dropshape
var offset: Vector2
var draggable = false
const SPEED = 300.0
var delay = 5
var spritescaley
var spritescalex

func _ready() -> void:
	dropshape = get_node("dropshape")
	spritescaley = $Dirnkablewindows.scale.y
	spritescalex = $Dirnkablewindows.scale.x
	draw_polygon($dropclickarea/droppolygon.get_polygon(), [Color.RED])
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if draggable:
		velocity += ((get_global_mouse_position() - offset) - to_global(position))
		velocity *= .9 
	if not is_on_floor() && !draggable:
		velocity += get_gravity() * delta
	elif !draggable: 
		velocity.y = 0
		velocity.x = velocity.x * .9
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if Geometry2D.is_point_in_polygon(event.position - self.position, $dropclickarea/droppolygon.get_polygon()):
				offset = get_global_mouse_position() - position
				draggable = true
		else:
			draggable = false
##if $dropclickarea/dropclickbox.get_rect().has_point(to_local(event.position)):
