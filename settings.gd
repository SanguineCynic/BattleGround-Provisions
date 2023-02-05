extends Node2D

onready var backBtn = get_node("BackButton")

func _back_pressed():
	backBtn.get_child(0).texture = load("res://Buttons/back_selected.png")
	yield(get_tree().create_timer(0.1), "timeout")
	backBtn.get_child(0).texture = load("res://Buttons/back_white.png")
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://MainMenu.tscn")

func _ready():
	backBtn.connect("pressed", self, "_back_pressed")

