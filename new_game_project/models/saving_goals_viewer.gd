extends Control
@onready var return_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button2
@onready var activeGoalWidget := preload("res://views/active_goal_widget.tscn")

func _ready() -> void:
	return_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/home.tscn"))
	populate_goals()


func populate_goals() -> void:
	var user = DBController.get_logged_in_user()
	for goal in user.goals:
		var widget = activeGoalWidget.instantiate()
		widget.populate(goal)
		$%SavingsGoalVbox.add_child(widget)
	pass
