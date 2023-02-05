extends Node2D

onready var playBtn = get_node("playButton")
onready var settingsBtn = get_node("settingsBtn")
onready var exitBtn = get_node("exitBtn")

var screen_size = OS.get_screen_size()

#var load_dict = { : "res://Buttons/play_selected.png"}
#
#func _btnpress(obj):
#	print(load_dict[])
#	obj.get_child(0).texture = load(load_dict[obj])

func _playbutton_pressed():
#	_btnpress(playBtn)
	playBtn.get_child(0).texture = load("res://Buttons/play_selected.png")
	yield(get_tree().create_timer(0.1), "timeout")
	playBtn.get_child(0).texture = load("res://Buttons/play FREE PIXEL ART BUTTONS.png")
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://CharacterSelect.tscn")
	
func _settings_pressed():
	settingsBtn.get_child(0).texture = load("res://Buttons/settings_selected.png")
	yield(get_tree().create_timer(0.1), "timeout")
	settingsBtn.get_child(0).texture = load("res://Buttons/settings FREE PIXEL ART BUTTONS.png")
	get_tree().change_scene("res://settings.tscn")
	
func _exit_pressed():
	exitBtn.get_child(0).texture = load("res://Buttons/exit_selected.png")
	yield(get_tree().create_timer(0.1), "timeout")
	exitBtn.get_child(0).texture = load("res://Buttons/exit FREE PIXEL ART BUTTONS.png")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().quit()
	

func _process(delta) -> void:
	if OS.get_screen_size() != screen_size: #Tests if your screen changed in size, e.g a different monitor
		screen_size = OS.get_screen_size()
		OS.set_window_size(screen_size)# Sets your window to your screen size
	
func _ready():
	playBtn.connect("pressed", self, "_playbutton_pressed")
	settingsBtn.connect("pressed",self,"_settings_pressed")
	exitBtn.connect("pressed",self,"_exit_pressed")
