extends Node2D

const SCROLL_SPEED: float = 180.0

@onready var score_sound = $ScoreSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x - delta * SCROLL_SPEED


func _on_screen_exited():
	queue_free()


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		body.die()


func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		score_sound.play()
		ScoreManager.increment_score()
