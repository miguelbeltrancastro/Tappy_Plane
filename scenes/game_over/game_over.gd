extends Control

@onready var go_label = $GOLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if space_label.visible == true and Input.is_action_just_pressed("fly") == true:
		GameManager.load_main_scene()

func on_plane_died() -> void:
	game_over_sound.play()
	show()
	timer.start()

func run_sequence() -> void:
	go_label.hide()
	space_label.show()
	

func _on_timer_timeout():
	run_sequence()
