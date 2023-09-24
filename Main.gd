extends Node

@export var enemy_scene: PackedScene
@export var runSpeed = 0.1

# create instance of enemy
@onready var enemy = enemy_scene.instantiate()

# choose a location on path2d, instantiate pathfollow2d
@onready var enemy_spawn_location = get_node("EnemyPath/EnemyPathFollow")

@onready var enemy_shape_cast = enemy.get_child(2)

# Called when the node enters the scene tree for the first time.
func _ready():
	# randomise vertex to choose starting vertex: 
	# https://docs.godotengine.org/en/stable/classes/class_pathfollow2d.html#class-pathfollow2d-property-progress-ratio
	enemy_spawn_location.progress_ratio = randf()

	# now get the random value from above and pass to the instance of enemy to choose starting point
	enemy.position = enemy_spawn_location.position
	
	add_child(enemy)
#	print(enemy_spawn_location.get_progress_ratio())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# move speed into main (as pertains to path) because velocity is determined by path vector
	# see previous docs link for methods
	enemy_spawn_location.set_progress_ratio(enemy_spawn_location.get_progress_ratio() + runSpeed * delta)
	enemy.position = enemy_spawn_location.position
	# https://docs.godotengine.org/en/stable/classes/class_shapecast2d.html#class-shapecast2d-method-is-colliding
	if enemy_shape_cast.is_colliding():
		print(enemy_shape_cast.is_colliding())
	
