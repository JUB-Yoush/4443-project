extends Control
class_name Login

@onready var usernameField := %UsernameField
@onready var passwordField := %PasswordField

@onready var usernameError := %UsernameError
@onready var passwordError := %PasswordError

@onready var loginError := %LoginError


@onready var loginBtn := %LoginButton
@onready var signupBtn := %SignupButton

func _ready() -> void:
	loginBtn.pressed.connect(login)
	if DBController.get_logged_in_user() != null:
		get_tree().change_scene_to_file("res://views/home.tscn")

	
func login() -> void:
	usernameError.text = ""
	passwordError.text = ""
	loginError.text = ""

	if usernameField.text == "":
		usernameError.text = "Username cannot be empty"
		return
	if passwordField.text == "":
		passwordError.text = "Password cannot be empty"
		return

	var user := DBController.get_user(usernameField.text)
	
	if user == null || user.password != passwordField.text:
		loginError.text = "Username or password incorrect"
		return 

	DBController.login_user(user)
	get_tree().change_scene_to_file("res://views/home.tscn")

	
