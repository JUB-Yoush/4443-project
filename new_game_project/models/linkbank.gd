extends Control
@onready var returnBtn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button2
func _ready() -> void:
	returnBtn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/home.tscn"))
