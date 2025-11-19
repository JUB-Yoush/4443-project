extends Resource
class_name User

@export var fname:String
@export var lname:String
@export var username:String
@export var password:String

var goals: Array[Goal]


func _to_string() -> String:
	return fname+" "+ lname +" " +username+ "\n"


# static func validate(fname:String lname:string) -> bool:
#     if user.
#     return true
