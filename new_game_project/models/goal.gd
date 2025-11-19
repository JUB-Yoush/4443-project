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

var goal_name:String
var saving_type:SavingsType
var freq:SavingsFreq 
var end_date:Dictionary
var goal_amount:int
var percentage_saved:int
var current_amount:int


