extends ScrollContainer
@export var saving_selection_group : ButtonGroup


@onready var spend_save_panel:BoxContainer = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/SpendSave
@onready var reg_save_panel:BoxContainer = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/RegSave
@onready var pay_save_panel:BoxContainer = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/PaySave

@onready var spend_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/SpendSaveBtn
@onready var reg_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/RegSaveBtn
@onready var pay_btn:Button = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/PaySaveBtn

@onready var spend_save_percent_label:RichTextLabel = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/SpendSave/PanelContainer/SavingControls/VBoxContainer/RichTextLabel2
@onready var spend_save_percent_val:HSlider = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/SpendSave/PanelContainer/SavingControls/VBoxContainer/HSlider

@onready var pay_save_percent_label:RichTextLabel = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/PaySave/PanelContainer/SavingControls/VBoxContainer/RichTextLabel2
@onready var pay_save_percent_val:HSlider = $PanelContainer/MarginContainer/VBoxContainer/SpendingControls/PaySave/PanelContainer/SavingControls/VBoxContainer/HSlider
func _ready():
	saving_button_select()
	spend_btn.pressed.connect(saving_button_select)
	reg_btn.pressed.connect(saving_button_select)
	pay_btn.pressed.connect(saving_button_select)
	spend_save_percent_val.value_changed.connect(spend_save_percent_val_change)
	pay_save_percent_val.value_changed.connect(pay_save_percent_val_change)


	
func saving_button_select():
	var button_pressed = saving_selection_group.get_pressed_button()
	match button_pressed.name:
		"SpendSaveBtn":
			spend_save_panel.visible = true
			reg_save_panel.visible = false
			pay_save_panel.visible = false
		"RegSaveBtn":
			spend_save_panel.visible = false
			reg_save_panel.visible = true
			pay_save_panel.visible = false
		"PaySaveBtn":
			spend_save_panel.visible = false
			reg_save_panel.visible = false
			pay_save_panel.visible = true
	
func spend_save_percent_val_change(new_value: float):
	var val = str(new_value).split(".", 1)[0]
	spend_save_percent_label.text = "Save " + val + "% of spending automatically"

func pay_save_percent_val_change(new_value: float):
	var val = str(new_value).split(".", 1)[0]
	pay_save_percent_label.text = "Save " + val + "% of spending automatically"
