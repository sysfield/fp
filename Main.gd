extends Node

@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# create instance of enemy
	var enemy = enemy_scene.instantiate()
	
	# choose a location on path2d, instantiate pathfollow2d
	var enemy_spawn_location = get_node("EnemyPath/EnemyPathFollow")
	# randomise vertex to choose: 
	# https://docs.godotengine.org/en/stable/classes/class_pathfollow2d.html#class-pathfollow2d-property-progress-ratio
	enemy_spawn_location.progress_ratio = randf()
	
	var direction = enemy_spawn_location.rotation + PI / 2
	
	# now get the random value from above and pass to the instance of enemy
	enemy.position = enemy_spawn_location.position
	
	# move speed into main (as pertains to path) because velocity is determined by path vector
	
#	direction += randf_range(-PI / 4, PI / 4)
#	enemy.rotation = direction
	
#	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
#	enemy.linear_velocity = velocity.rotated(direction)
	
	add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
