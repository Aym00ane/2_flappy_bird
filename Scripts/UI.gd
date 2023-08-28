extends CanvasLayer
class_name UI
@onready var game_over_box = $MarginContainer/GameOverBox
@onready var points_label = $MarginContainer/PointsLabel

func _ready():
	points_label.text = "%d" % 0
	
func update_points(points: int):
		points_label.text = "%d" % points

func on_game_over():
	game_over_box.visible = true

func _on_button_pressed():
	get_tree().reload_current_scene()
