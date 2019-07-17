extends GraphNode

const nodeType = "playerGetItemNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(1,1,0,1),true, 0, Color(1,1,0,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_message()->String:
	return get_node("message").get_text()
	
	
func get_item_from_npc()->String:
	return get_node("itemToGetFromNpc").get_text()	


func _on_npcGetItemNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
	pass # Replace with function body.


func _on_npcGetItemNode_resize_request(new_minsize):
	rect_size = new_minsize
	pass # Replace with function body.
