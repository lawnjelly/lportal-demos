extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var m_xrange
var m_yrange

var m_ptDest = Vector3(0, 1, 0)
var m_Angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var tr = translation
	var diff = m_ptDest - tr
	
	var angle = atan2(diff.z, diff.x)
	
	m_Angle = lerp_angle(m_Angle, angle, delta)
	
	var yaw = (PI*0.5) - m_Angle
	rotation = Vector3(0, yaw, 0)
	
	var move = Vector2(cos (angle), sin(angle))
	#print("move " + str(move))
	move *= delta * 1
	
	tr.x += move.x
	tr.z += move.y
	tr.y = 0.5

	translation = tr	
	
	var sl = diff.length_squared()
	#print ("sl " + str(sl))
	if (sl < 2):
		choose_dest()
	pass


func setup(var xrange, var yrange):
	m_xrange = xrange
	m_yrange = yrange
	
	choose_dest()
	translation = m_ptDest
	choose_dest()
	
	pass

func choose_dest():
	m_ptDest.x = rand_range(0, m_xrange)
	m_ptDest.z = rand_range(0, m_yrange)
	#print("choose dest" + str(m_ptDest))
	#get_parent().get_parent().get_node("Indicator").translation = m_ptDest
