extends Control

@onready var loginBtn:Button = %Login
@onready var firstName:TextEdit = %FirstName
@onready var lastName:TextEdit = %LastNameName
@onready var userName:TextEdit = %UserName
@onready var password:TextEdit = %Password

func _ready() -> void:
    loginBtn.pressed.connect(make_user)

func make_user() -> User:
    # TODO validate input
    var u = User.new()
    u.person_name = new()
    u.person_name.first = firstName.text
    u.person_name.last = lastName.text
    u.username = userName.text
    u.password = password.text
    return u