extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Manager.rooms_convert(true, false)
	
	var dob_id = $Manager.dob_register($Camera, $Camera.translation, 0)
	$Manager.rooms_set_camera(dob_id, $Camera)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera.rotate_y(delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		$Manager.rooms_log_frame()
