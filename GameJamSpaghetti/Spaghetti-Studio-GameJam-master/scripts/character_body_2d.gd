extends CharacterBody2D

const SPEED := 200.0
var current_dir := "none"


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var fade: ColorRect = $"../CanvasLayer/Fade"   # Fade nella stessa scena

func _ready() -> void:
	anim.play("front_idle")


func _physics_process(delta: float) -> void:
	player_movement(delta)
	move_and_slide()




func player_movement(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity = Vector2(SPEED, 0)

	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity = Vector2(-SPEED, 0)

	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity = Vector2(0, SPEED)

	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity = Vector2(0, -SPEED)
		
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity = Vector2(-SPEED, 0)
		
	elif Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity = Vector2(SPEED, 0)
		
	elif Input.is_action_pressed("front"):
		current_dir = "front"
		play_anim(1)
		velocity = Vector2(0, -SPEED)
		
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity = Vector2(0, SPEED)
		

	else:
		play_anim(0)
		velocity = Vector2.ZERO


func play_anim(movement: int) -> void:
	if current_dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	elif current_dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	elif current_dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
		else:
			anim.play("front_idle")

	elif current_dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
	move_and_slide()
