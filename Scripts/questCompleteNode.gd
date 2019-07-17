extends GraphNode

const nodeType = "questCompleteNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(1,0,1,1),true, 0, Color(1,0,1,1))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_message()->String:
	return get_node("message").get_text()
	
func get_quest_to_complete()->String:
	return get_node("questToComplete").get_text()

func _on_questCompleteNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
	pass # Replace with function body.


func _on_questCompleteNode_resize_request(new_minsize):
	rect_size = new_minsize
	pass # Replace with function body.
