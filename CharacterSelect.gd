extends Node2D


onready var fightBtn = get_node("FightButton")

func _fightbutton_pressed():
	
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://world.tscn")

func _ready():
	fightBtn.connect("pressed", self, "_fightbutton_pressed")

