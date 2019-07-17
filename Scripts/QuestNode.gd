extends GraphNode

const nodeType = "questNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(1,0,0,1),true, 0, Color(1,0,0,1))

func get_quest_to_start()->String:
	return get_node("QuestToStart").get_text()

func get_message()->String:
	return get_node("Message").get_text()

func _on_QuestNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()


func _on_QuestNode_resize_request(new_minsize):
	rect_size = new_minsize
