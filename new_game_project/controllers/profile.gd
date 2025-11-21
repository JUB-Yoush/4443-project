extends Control

func _ready() -> void:
	$%LogoutButton.pressed.connect(logout)
	$%NameLabel.text = "[b]"+ DBController.get_logged_in_user().get_users_name()+ "[/b]"
	$%Return.pressed.connect(func(): get_tree().change_scene_to_file("res://views/home.tscn"))

func logout() -> void:
	DBController.logout()
	get_tree().change_scene_to_file("res://views/login.tscn")
