extends Control

func _ready() -> void:
	$%LogoutButton.pressed.connect(logout)
	$%NameLabel.text = "[b]"+ DBController.get_logged_in_user().get_users_name()+ "[/b]"

func logout() -> void:
	DBController.logout()
	get_tree().change_scene_to_file("res://views/login.tscn")
