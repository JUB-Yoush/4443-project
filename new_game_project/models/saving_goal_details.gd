extends Control

@onready var return_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button2
var goal:Goal

func _ready() -> void:
	goal = DBController.get_db().current_goal
	return_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/saving_goals_viewer.tscn"))
	populate()

func populate() -> void:
	$%GoalName.text = "[b]"+goal.goal_name+"[/b]"
	$%GoalAmount.text = "[b]$"+str(goal.goal_amount)+"[/b]"
	$%DueText.text =  DBController.make_bold("Due: " + DBController.date_to_string(goal.end_date))
	$%DaysRemaining.text = DBController.make_bold(str(DBController.get_days_between(Time.get_unix_time_from_system(),Time.get_unix_time_from_datetime_dict(goal.end_date))) + " Days Remaining")
	$%GoalFractionAmount.text = DBController.make_bold("Goal ($): ") + str(goal.current_amount) + "/" + str(goal.goal_amount)
