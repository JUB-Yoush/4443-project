extends Control
class_name Login

@onready var usernameField := %UsernameField
@onready var passwordField := %PasswordField

@onready var usernameError := %UsernameError
@onready var passwordError := %PasswordError

@onready var loginBtn := %LoginButton
@onready var signupBtn := %SignupButton


func _ready() -> void:
	loginBtn.pressed.connect(login)
	AppData.get_db()
	
func login() -> void:
	passwordError.text = ""
	usernameError.text = ""

	if usernameField.text == "":
		usernameError.text = "Username cannot be empty"
	if passwordField.text == "":
		passwordError.text = "Password cannot be empty"

	pass
	
