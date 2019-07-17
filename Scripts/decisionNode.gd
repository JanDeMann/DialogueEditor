extends GraphNode

const nodeType = "decisionNode"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(0,0,1,1),true, 0, Color(0,0,1,1))
	set_slot(1, false, 0, Color(0,0,1,1),true, 0, Color(0,0,1,1))
	pass

func get_message()->String:
	return get_node("message").get_text()

func get_decision_1()->String:
	return get_node("Decision1").get_text()
	
func get_decision_2()->String:
	return get_node("Decision2").get_text()	

func _on_decisionNode_resize_request(new_minsize):
	rect_size = new_minsize

func _on_decisionNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
