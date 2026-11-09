class_name Brick
extends RigidBody2D
@onready var sprite: Sprite2D = $Sprite2D
var hp = 1
signal Scored


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func hit():
	
	hp -= 1
	if hp <=0:
		Scored.emit()
		
		queue_free()
func _on_timer_timeout() -> void:

	for c in get_children():
		if c is not Sprite2D: continue
		var next_frame = (c.frame_coords.x + 1) % c.hframes
		c.frame_coords.x = next_frame
