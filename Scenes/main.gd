extends Control

#drag node from Scene list and then press CTRL to auto add reference
@onready var mine_animation_player: AnimationPlayer = $AnimationPlayer
@onready var mine_label: Label = $MarginContainer/PanelContainer/MarginContainer/PlayArea/MineSpace/MiningMarginContainer/MiningVBox/IronLabel
@onready var speed_upgrade_button: Button = $MarginContainer/PanelContainer/MarginContainer/PlayArea/Upgrades/UpgradeMarginContainer/UpgradeVBox/SpeedUpgrade
@onready var output_upgrade_button: Button = $MarginContainer/PanelContainer/MarginContainer/PlayArea/Upgrades/UpgradeMarginContainer/UpgradeVBox/OutputUpgrade

var iron = 0
var output_cost = 2
var speed = 1
var speed_cost = 2
var iron_output = 1

func _ready() -> void:
	updateText()

func _on_button_pressed() -> void:
	mine_animation_player.play("Mine")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	iron += iron_output
	mine_label.text = "Iron: " + str(iron)

func updateText():
	mine_label.text = "Iron: " + str(iron)
	output_upgrade_button.text = "Output Upgrade \n" + "Cost: " + str(output_cost) + " iron.\n Current output: " + str(iron_output)
	speed_upgrade_button.text = "Speed Upgrade \n" + "Cost: " + str(speed_cost) + " iron.\n Current speed: " + str(speed)

func _on_output_upgrade_pressed() -> void:
	if iron >= output_cost:
		iron -= output_cost
		iron_output += 1
		output_cost = output_cost*2
		updateText()

func _on_speed_upgrade_pressed() -> void:
	if iron >= speed_cost:
		iron -= speed_cost
		speed += 1
		mine_animation_player.speed_scale = speed
		speed_cost = speed_cost*2
		updateText()
