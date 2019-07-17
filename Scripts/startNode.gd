extends GraphNode

const nodeType = "startNode"
var nextNode

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, false, 0, Color(1,0.5,0,1),true, 0, Color(1,0.5,0,1))


func _on_startNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
	pass # Replace with function body.


func _on_startNode_resize_request(new_minsize):
	rect_size = new_minsize


func get_message()->String:
	return get_node("message").get_text()