extends KinematicBody2D
var speed = 200
var gravity = 800
var jump_force = -400
var velocity = Vector2.ZERO
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	velocity.y += gravity * delta
	if is_on_floor() and Input.is_action_just_pressed("ui_select"):
		velocity.y = jump_force

	velocity = move_and_slide(velocity, Vector2.UP)
var coins = 0
signal coins_changed
func add_coin():
	coins += 1
	emit_signal("coins_changed", coins)
