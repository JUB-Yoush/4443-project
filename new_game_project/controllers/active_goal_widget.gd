extends Button

var goal:Goal 

const GOAL_TYPE_MAP = ["Spending","Regular","Deposit"]

func _ready() -> void:
	pressed.connect(view_goal)

func populate(new_goal:Goal) -> void:
	goal = new_goal
	$%Title.text = goal.goal_name
	$%GoalBar.value = float(goal.current_amount) / float(goal.goal_amount)
	$%BarLabels.text = "$"+str(goal.current_amount) +" $"+str(goal.goal_amount)
	$%GoalType.text = GOAL_TYPE_MAP[goal.saving_type]
	
func view_goal():
	DBController.set_current_goal(goal)
	get_tree().change_scene_to_file("res://views/saving_goal_details.tscn")
