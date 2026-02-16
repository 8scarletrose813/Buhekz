extends KinematicBody2D
export(Vector2) var move_direction = Vector2(0, 1)
export(float) var distance = 55
export(float) var speed = 80

var start_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	var movement = move_direction.normalized() * speed * direction * delta
	move_and_collide(movement)

	if global_position.distance_to(start_position) >= distance:
		direction *= -1
