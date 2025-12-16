extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_input(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		interact()

func _on_body_entered(body: Node2D) -> void:
	set_process_unhandled_input(true)
	$Label.show()

	
func _on_body_exited(body: Node2D) -> void:
	set_process_unhandled_input(false)
	$Label.hide()
	

func interact():
	var size = Vector2.ZERO;
	size.x = 4
	size.y = 4
	self.set_scale(size)
