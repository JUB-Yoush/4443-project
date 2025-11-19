extends Control

@onready var activeGoalWidget := preload("res://views/active_goal_widget.tscn")

func _ready() -> void:
	$%NameLabel.text = "[b]Hello " + DBController.get_logged_in_user().fname + "[/b]"
	$%SavedLabel.text = "[b]$" + str(DBController.get_logged_in_user().get_total_saved()) + "[/b]"
	$%SeeAllButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/saving_goals_viewer.tscn"))
	$%NewGoalButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/saving_goal_maker.tscn"))
	populate_goals()


func populate_goals() -> void:
	var user = DBController.get_logged_in_user()
	var i = 0
	for goal in user.goals:
		var widget = activeGoalWidget.instantiate()
		widget.populate(goal)
		$%ActiveGoalVbox.add_child(widget)
		i += 1
		if i == 3:
			break
	pass
