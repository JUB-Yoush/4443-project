extends Control

@export var banking_selection_group : ButtonGroup

@onready var RBC_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/DetectedBankAccounts/RBCBtn
@onready var scotia_btn:Button =$PanelContainer/MarginContainer/VBoxContainer/DetectedBankAccounts/ScotiaBtn
@onready var BMO_btn:Button =$PanelContainer/MarginContainer/VBoxContainer/DetectedBankAccounts/BMOBtn
@onready var confirm_bank_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button

@onready var return_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/Button2

#CONTAINERS
@onready var bank_selection:Container = $PanelContainer/MarginContainer
@onready var confirm_bank_selection:Container = $PanelContainer/MarginContainer2

@onready var bank_selected_text:RichTextLabel = $PanelContainer/MarginContainer2/VBoxContainer/RichTextLabel2

var selectedBank=""; #Should change based on what the user's preference is

func _ready() -> void:
	return_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://views/home.tscn"))
	
	#Initial check for user's existance bank preference
	if selectedBank == "Bank of Montreal (BMO)":
		BMO_btn.button_pressed = true
	elif selectedBank == "Scotiabank":
		scotia_btn.button_pressed = true
	else:
		RBC_btn.button_pressed = true
	
	confirm_bank_btn.pressed.connect(saving_button_select)
	

func saving_button_select():
	var button_pressed = banking_selection_group.get_pressed_button()
	match button_pressed.name:
		"RBCBtn":
			selectedBank = "Royal Bank of Canada (RBC)"
		"ScotiaBtn":
			selectedBank = "Scotiabank"
		"BMOBtn":
			selectedBank = "Bank of Montreal (BMO)"
			
	bank_selected_text.text = selectedBank
	bank_selection.visible = false
	confirm_bank_selection.visible = true
	
