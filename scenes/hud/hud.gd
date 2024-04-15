extends Control

@onready var score_label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_updated.connect(on_score_updated)

func on_score_updated():
	score_label.text = str(ScoreManager.get_score())
