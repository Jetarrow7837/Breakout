extends CharacterBody2D


var speed = 200
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var dir = Vector2.UP
var init_pos = Vector2(320,280)

func _ready() -> void:
	reset()


func _physics_process(delta: float) -> void:
	var is_active : bool = true
	if is_active:
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			if collision.get_collider() is Brick:
				audio.play()
				collision.get_collider().hit()
			
		if velocity.y >= 0 and velocity.y < 100:
			velocity.y = -200
		if velocity.x == 0:
			velocity.x = -200

func reset():
	
	velocity = Vector2([speed,-speed].pick_random() , -speed)
	global_position = init_pos
