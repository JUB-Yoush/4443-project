extends Resource
class_name Goal

enum SavingsType{
   SPENDING, 
   REGULAR,
   DEPOSIT
}

enum SavingsFreq{
	NONE,
	DAILY,
	WEEKLY,
	MONTHLY,
}


@export var goal_name:String
@export var saving_type:SavingsType
@export var freq:SavingsFreq 
@export var end_date:Dictionary
@export var goal_amount:int
@export var regular_savings_amount:int
@export var percentage_saved:int
@export var current_amount:int


