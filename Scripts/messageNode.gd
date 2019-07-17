extends GraphNode

const nodeType = "messageNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_all_slots()
	set_slot(0, true, 0, Color(0,1,0,1), true, 0, Color(0,1,0,1))

func _on_messageNode_close_request():
	get_parent().nodes.remove(get_parent().nodes.find(get_name()))
	queue_free()


func _on_messageNode_resize_request(new_minsize):
	rect_size = new_minsize


#Retorna el mensaje de texto
func get_message()->String:
	return get_node("message").get_text()



func _on_SpinBox_value_changed(value):
	print ("calling: ", value)
	if get_connection_output_count() > value:
		clear_slot(get_connection_output_count())
		pass
	elif get_connection_output_count() < value:
		print("create slot")
		set_slot(get_connection_output_count(), false, 1, Color.white, true, 1, Color.green)
		pass
	
	pass
