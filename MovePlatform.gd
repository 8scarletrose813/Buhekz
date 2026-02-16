extends KinematicBody2D

export(Vector2) var move_direction = Vector2(1, 0)
export(float) var distance = 200
export(float) var speed = 100

var start_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	var movement = move_direction.normalized() * speed * direction * delta
	move_and_collide(movement)

	if global_position.distance_to(start_position) >= distance:
		direction *= -1
