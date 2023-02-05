extends KinematicBody2D

var motion = Vector2()
var movespeed = 25

func _ready():
	pass

func _physics_process(_delta):
	var Player = get_parent().get_node("Player")
	look_at(Player.position)
	motion = (Player.position - position).normalized()
	motion = move_and_slide(motion * movespeed)

func _on_Area2D_body_entered(body):
	if "CarrotSlice" in body.name:
		$Timer.connect("timeout", self, "queue_free")
		$Timer.set_wait_time(0.05)
		$Timer.start()
