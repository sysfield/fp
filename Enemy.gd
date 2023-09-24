extends Sprite2D

var speed = 100
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x += speed * delta
	self.position.clamp(Vector2.ZERO, screen_size)
