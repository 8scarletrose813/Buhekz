extends Area2D

export(Array, String) var dialogue = [
	"Hello!",
	"As the strongest Bukhez, you were sent on a mission. The mission is to overcome obstacles and find the key and the door.",
	"And they'll return home, so good luck with your mission.",
	"To start the task, you need to go straight ahead."
]

var player_inside = false
var index = 0

func _ready():
	#connect("body_entered", self, "_on_NPC_body_entered")
	#connect("body_exited", self, "_on_NPC_body_exited")
	$DialogueUI.visible = false

func _on_NPC_body_entered(body):
	if body.is_in_group("Player"):
		player_inside = true

func _on_NPC_body_exited(body):
	if body.is_in_group("Player"):
		player_inside = false
		$DialogueUI.visible = false
		index = 0

func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		show_dialogue()

func show_dialogue():
	if index >= dialogue.size():
		index = 0
		player_inside = false
		$DialogueUI.visible = false
	else:
		$DialogueUI.visible = true
		$DialogueUI/Panel/Label.text = dialogue[index]
		index += 1
