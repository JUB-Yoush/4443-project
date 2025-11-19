extends Control

@onready var loginBtn:Button = %LoginButton
@onready var registerButton:Button = %RegisterButton

@onready var firstName:TextEdit = %FirstnameField
@onready var lastName:TextEdit = %LastnameField
@onready var userName:TextEdit = %UsernameField
@onready var password:TextEdit = %PasswordField

func _ready() -> void:
	DBController.log_users()
	registerButton.pressed.connect(signup)
	loginBtn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/login.tscn"))

func make_user() -> User:
	var u = User.new()
	u.fname= firstName.text 
	u.lname = lastName.text
	u.username = userName.text
	u.password = password.text
	return u

func valid_input() -> bool:
	$%FirstnameError.text = ""	
	$%LastnameError.text = ""
	$%UsernameError.text = ""
	$%PasswordError.text = ""
	$%RegisterError.text = ""	


	if firstName.text == "":
		$%FirstnameError.text = "First Name cannot be empty"
		return false
	if lastName.text == "":
		$%LastnameError.text = "Last Name cannot be empty"
		return false
	if userName.text == "":
		$%UsernameError.text = "User Name cannot be empty"
		return false
	if firstName.text == "":
		$%PasswordError.text = "Password cannot be empty"
		return false
	return true

func signup() -> void:
	if !valid_input():
		return
	if DBController.get_user(userName.text) != null:
		$%RegisterError.text = "user already exists, please log in"	
		return 
	var user = make_user()
	DBController.add_user(user)
	get_tree().change_scene_to_file("res://views/home.tscn")
