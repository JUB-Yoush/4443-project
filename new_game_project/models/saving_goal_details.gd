extends Control

@onready var return_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button2

func _ready() -> void:
	return_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/saving_goals_viewer.tscn"))
