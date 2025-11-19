extends PanelContainer

func _ready() -> void:
	$%HomeButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/home.tscn"))
	$%BankButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/linkbank.tscn"))
	$%SaveButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/saving_goals_viewer.tscn"))
	$%ProfileButton.pressed.connect(func(): get_tree().change_scene_to_file("res://views/profile.tscn"))
