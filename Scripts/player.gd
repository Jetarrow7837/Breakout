extends AnimatableBody2D


const SPEED = 600.0
var screen_size
func _ready() -> void:
	screen_size = get_viewport_rect().size.x

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("left", "right")
	position.x += direction * SPEED * delta
	position.x = clampf(position.x, 48 , screen_size - 48)
