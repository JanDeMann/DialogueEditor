extends GraphNode

const nodeType = "endNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(0,1,1,1), false, 0, Color(0,1,1,1))

func get_message()->String:
	return get_node("message").get_text()


func _on_endNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
	
	


func _on_endNode_resize_request(new_minsize):
	rect_size = new_minsize
