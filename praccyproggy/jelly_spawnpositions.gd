extends Marker2D
var spawncount = 0

func next_spawnpoint() -> Vector2:
	spawncount+= 1
	if(spawncount % 4 == 0):
		return self.position
	elif(spawncount % 4 == 1):
		return $jellySpawn1.global_position
	elif(spawncount % 4 == 2):
		return $jellySpawn2.global_position
	else:
		return $jellySpawn3.global_position
