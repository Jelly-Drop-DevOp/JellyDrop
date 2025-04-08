extends Marker2D

var spawncount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawncount = 0

func next_spawnpoint() -> Vector2:
	spawncount+= 1
	if(spawncount % 4 == 0):
		return $jellySpawn4.global_position
	elif(spawncount % 4 == 1):
		return $jellySpawn1.global_position
	elif(spawncount % 4 == 2):
		return $jellySpawn2.global_position
	else:
		return $jellySpawn3.global_position
