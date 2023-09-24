# initial skeleton for code obtained here:
# https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html

extends Sprite2D

var speed = 1000
var screen_size
var sprite_x

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# https://ask.godotengine.org/71609/clamp-2d-not-working-in-main-scene
	sprite_x = self.texture.get_width() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	position.x = clamp(position.x, 0 + sprite_x, screen_size.x - sprite_x)
	position.y = clamp(position.y, 0, screen_size.y)
	if position.x == screen_size.x - sprite_x:
		speed = -(speed)
	elif position.x == 0 + sprite_x:
		speed = speed * -2
