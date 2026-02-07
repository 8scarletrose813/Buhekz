extends KinematicBody2D
var speed = 200
var direction = -1
var gravity = 800
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)

	if is_on_wall():
		direction *= -1
func _on_Area2D_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(global_position)

