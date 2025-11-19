extends ScrollContainer

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

@onready var spendingWidget = $%SpendingSave
@onready var regularWidget = $%RegularSave
@onready var depositWidget = $%DepositSave

var current_trigger := SavingsType.SPENDING

var freq := SavingsFreq.DAILY

var percentage_saved = 0
var regular_savings_amount := 0.0
var goal_name := ""

var datetime:Dictionary 

@onready var datePickerPanel := %DatePickerPanel

func _ready():
	change_trigger(SavingsType.SPENDING)
	$%DailySave.button_pressed = true

	$%SpendingSaveBtn.pressed.connect(func(): change_trigger(SavingsType.SPENDING))
	$%RegularSaveBtn.pressed.connect(func(): change_trigger(SavingsType.REGULAR))
	$%DepositSaveBtn.pressed.connect(func(): change_trigger(SavingsType.DEPOSIT))
	
	$%SpendingSlider.value_changed.connect(func(value:float): 
		percentage_saved = int(value)
		$%SpendingLabel.text = "Save " + str(int(value)) + "% of payout automatically" )

	$%DepositSlider.value_changed.connect(func(value:float): 
		percentage_saved = int(value)
		$%DepositLabel.text = "Save " + str(int(value)) + "% of payout automatically" 
		)
	
	$%DailySave.pressed.connect(func(): freq = SavingsFreq.DAILY)
	$%WeeklySave.pressed.connect(func(): freq = SavingsFreq.WEEKLY)
	$%MonthlySave.pressed.connect(func(): freq = SavingsFreq.MONTHLY)

	$%SavingAmountEntry.value_changed.connect(func(value:float): regular_savings_amount = value)
	
	$%GoalNameEntry.text_changed.connect(func(value:String): goal_name = value )
	
	$%Submit.pressed.connect(submit)

func change_trigger(new_trigger:SavingsType) -> void:
	current_trigger = new_trigger
	spendingWidget.visible = SavingsType.SPENDING == current_trigger
	regularWidget.visible = SavingsType.REGULAR == current_trigger
	depositWidget.visible = SavingsType.DEPOSIT == current_trigger

func validate() -> bool:
	datetime = datePickerPanel.get_date_data()
	if goal_name == "":
		return false
	return true

func submit() -> void:
	if !validate():
		print("form is fucked up fix it")
		return
	var g = Goal.new()
	g.goal_name = goal_name
	g.saving_type = current_trigger
	g.freq = freq
	g.end_date = datetime
	g.goal_amount = regular_savings_amount
	g.percentage_saved = percentage_saved
	g.current_amount = 0
	DBController.add_goal(g)
	
		
