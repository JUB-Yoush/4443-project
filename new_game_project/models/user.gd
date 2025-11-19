extends Resource
class_name User

@export var fname:String
@export var lname:String
@export var username:String
@export var password:String

@export var account_creation_date:Dictionary

@export var goals: Array[Goal]

func get_users_name():
	return fname+" "+ lname

func _to_string() -> String:
	return fname+" "+ lname +" " +username+ "\n"


func get_total_saved() -> float:
	var out = 0
	for goal in goals:
		out += goal.current_amount
	return out

# static func validate(fname:String lname:string) -> bool:
#     if user.
#     return true
