extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "queue_free")
	$Timer.set_wait_time(2)
	$Timer.start()

func _on_GarlicClove_body_entered(body):
	if body is TileMap:
		queue_free()
	if "Enemy" in body.name:
		print("HELLO WORLD")
		queue_free()
