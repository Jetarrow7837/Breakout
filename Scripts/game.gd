extends Node2D
@onready var brick :=  preload("uid://be6m7brci0ic2")
@export var life: Label

@export var score_lb: Label

var score: int = 0000
var lives = 3
var rows:= randi_range(2,6)
var cols := 18
var margin_h:= 30
var margin_v:= 20
var gap_up_down := 20
var gap_left_right := 34
var rng =RandomNumberGenerator.new()

func _ready() -> void:
	rng.seed = 12345
	for r in rows:
		for c in cols:
			var rnum = rng.randi_range(0,15)
			if rnum > 0:
				var new_bick : Brick = brick.instantiate()
				add_child(new_bick)
				new_bick.connect(&"Scored", update_score)
				var brick_type := rng.randi_range(0, new_bick.sprite.vframes - 1)
				new_bick.sprite.frame_coords.y = brick_type
				new_bick.sprite.frame_coords.x = rng.randi_range(0, new_bick.sprite.hframes - 1)
				new_bick.position = Vector2(margin_h + (gap_left_right * c), margin_v + (gap_up_down * r))





func _process(_delta: float) -> void:
	
	if lives<=0:
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
		







func update_score():
	
	score += 10
	score_lb.text = "Score: " + str(score)

func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.reset()
		lives -= 1
		life.text = "Lives: " + str(lives)
