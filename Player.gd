extends KinematicBody2D

var movespeed = 50
var clove_speed = 100
var shoot_distance = 10
var clove = preload("res://GarlicClove.tscn")
onready var sprite = get_node("AnimatedSprite")

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	
	if (get_global_mouse_position() - get_global_position()).x >= 0:
		sprite.flip_h = true
	else:
		sprite.flip_h= false
	
	if motion.length() == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
	
	motion = motion.normalized()
	move_and_slide(motion * movespeed)
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_dest = get_global_mouse_position()
	var bullet_dir = (bullet_dest-get_global_position()).normalized()
	var clove_instance = clove.instance()
	clove_instance.position = get_global_position() + bullet_dir * shoot_distance
	clove_instance.look_at(get_global_mouse_position())
	clove_instance.rotate(PI/4)
	clove_instance.set_axis_velocity(bullet_dir * clove_speed)
	get_tree().get_root().call_deferred("add_child",clove_instance)

func kill():
	get_tree().reload_current_scene()



func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()
