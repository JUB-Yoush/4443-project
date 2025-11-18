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
	AppData.get_db()
	
func login() -> void:
	passwordError.text = ""
	usernameError.text = ""
	loginError.text = ""

	if usernameField.text == "":
		usernameError.text = "Username cannot be empty"
		return
	if passwordField.text == "":
		passwordError.text = "Password cannot be empty"
		return

	var user := AppData.get_user(usernameField.text)
	
	if user == null || user.password != passwordField.text:
		loginError.text = "Username or password incorrect"

	AppData.login_user(user)

	
