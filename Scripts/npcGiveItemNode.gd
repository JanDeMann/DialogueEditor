extends GraphNode

const nodeType = "npcGiveItemNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(0,0,0,1),true, 0, Color(0,0,0,1))
	pass # Replace with function body.

func get_item_to_give()->String:
	return get_node("item").get_text()

func get_message()->String:
	return get_node("message").get_text()

func _on_npcGiveItemNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()


func _on_npcGiveItemNode_resize_request(new_minsize):
	rect_size = new_minsize
