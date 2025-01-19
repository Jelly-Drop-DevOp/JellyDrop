extends CharacterBody2D


const SPEED = 75.0
const JUMP_VELOCITY = -400.0
var idletime = (randi() %  100 + 10)
var direction = Vector2(randi() % 3 - 1, randi() % 3 - 1)
var busyTimer = 0
@export var speed = 400

##func _ready():
	##print()
	##$JellyAnimations.material.set_shader_parameter("dropcolor", dropcolor)


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	print(input_direction)
	#JellyAnimaitons.play("move")

func _physics_process(delta):
	#get_input()
	jellyAi()
	move_and_slide()

func jellyAi():
	if(busyTimer <=0):
		var decisionMaker = randi() % 2
		if(decisionMaker == 1):
			idle()
		if(decisionMaker == 0):
			##idle()
			wander()
	busyTimer = busyTimer - 1
	##print(busyTimer)

func idle():
	$JellyAnimations.play("idle_fill")
	$JellyAnimations/JellyLineart.play("idle_lineart")
	$JellyAnimations/JellyShine.play("idle_shine")
	velocity = Vector2(0, 0)
	busyTimer = randi() % 100 - 20

func wander():
	$JellyAnimations.play("move")
	$JellyAnimations/JellyLineart.stop()
	$JellyAnimations/JellyShine.stop()
	direction = Vector2(randi() % 3 - 1, randi() % 3 - 1)
	$JellyAnimations.flip_h = direction.x <= 0
	print(direction)
	velocity = direction * SPEED
	busyTimer = randi() % 150 - 50
	
