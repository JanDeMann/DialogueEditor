extends GraphNode

const nodeType = "rewardQuestNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(1,1,1,1),true, 0, Color(1,1,1,1))
	pass # Replace with function body.

func get_message()->String:
	return get_node("message").get_text()
	
func get_object_to_reward()->String:
	return get_node("objectToReward").get_text()	

func get_souls_to_reward()->int:
	return get_node("soulsToReward").value

func _on_rewardQuestNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()
	pass # Replace with function body.


func _on_rewardQuestNode_resize_request(new_minsize):
	rect_size = new_minsize
	pass # Replace with function body.
