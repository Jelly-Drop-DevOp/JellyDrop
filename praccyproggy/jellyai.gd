extends CharacterBody2D

const SPEED = 75.0
const JUMP_VELOCITY = -400.0
var idletime = (randi() %  100 + 10)
var direction = Vector2(randi() % 3 - 1, randi() % 3 - 1)
var busyTimer = 0
@export var speed = 400


#currently unused get input command to alow for manual jelly controll.

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	#get_input()
	jellyAi()
	move_and_slide()

#Main jelly ai controller, manages the jellies busy timer(time between actions).
#upon busy timer reacher 0 it makes a decision as to its next action and how long it will take.
#currently decided at random between idle and wander modes.
#actions continue until busy timer reaches 0 and counts down each game tic.

func jellyAi():
	if(busyTimer <=0):
		var decisionMaker = randi() % 2
		if(decisionMaker == 1):
			idle()
		if(decisionMaker == 0):
			##idle()
			wander()
	busyTimer = busyTimer - 1

#idle state to be called by jellyai simply plays basic idle animations and sets busy timer

func idle():
	$JellyAnimations.play("idle_fill")
	$JellyAnimations/JellyLineart.play("idle_lineart")
	$JellyAnimations/JellyShine.play("idle_shine")
	velocity = Vector2(0, 0)
	busyTimer = randi() % 100 - 20

#wander state to be called by jellyai picks a random direction (V2 with a random x and y value).
#random direction is multiplies by jellies speed for its velocity and busy time is set.
#movement will continue untill busy timer reaches 0.

func wander():
	$JellyAnimations.play("move")
	$JellyAnimations/JellyLineart.play("move_lineart")
	$JellyAnimations/JellyShine.play("move_shine")
	direction = Vector2(randi() % 3 - 1, randi() % 3 - 1)
	$JellyAnimations.flip_h = direction.x <= 0
	$JellyAnimations/JellyLineart.flip_h = direction.x <= 0
	$JellyAnimations/JellyShine.flip_h = direction.x <= 0
	velocity = direction * SPEED
	busyTimer = randi() % 150 - 50
	
