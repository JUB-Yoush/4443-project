extends MarginContainer

var goal:Goal 

func _ready() -> void:
    $Button.pressed.connect(view_goal)

func populate(new_goal:Goal) -> void:
    goal = new_goal
    $%Title.text = goal.goal_name
    $%GoalBar.value = float(goal.current_amount) / float(goal.goal_amount)
    
func view_goal():
    DBController.set_current_goal(goal)
    get_tree().change_scene_to_file("res://views/saving_goals_viewer.tscn")
    pass