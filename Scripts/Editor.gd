extends GraphEdit

#Nodes
var messageNode = load("res://Scenes/messageNode.tscn")
var decisionNode = load("res://Scenes/decisionNode.tscn")
var questNode = load("res://Scenes/QuestNode.tscn")
var playerGetItemNode = load("res://Scenes/playerGetItemNode.tscn")
var questCompleteNode = load("res://Scenes/questCompleteNode.tscn")
var rewardQuestNode = load ("res://Scenes/rewardQuestNode.tscn")
var playerGiveItemNode = load("res://Scenes/playerGiveItemNode.tscn")
var endNode = load ("res://Scenes/endNode.tscn")
var startNode = load ("res://Scenes/startNode.tscn")

const startNodeDataStructure	 		= {"id":"", "nodeType":"startNode", "message":"", "nextNode":""}
const messageNodeDataStructure 			= {"id":"", "nodeType":"messageNode", "message":"", "nextNode":""}
const decisionNodeDataStructure			= {"id":"", "nodeType":"decisionNode", "message":"", "nextNode1":"", "nextNode2":"", "decision1":"", "decision2":""}
const questNodeDataStructure 			= {"id":"", "nodeType":"questNode", "message":"", "questToStart":""}
const playerGetItemNodeDataStructure	= {"id":"", "nodeType":"playerGetItemNode", "message":"", "item":""}
const questCompleteNodeDataStructure	= {"id":"", "nodeType":"quesCompleteNode", "message":"", "questToComplete":""}
const rewardQuestNodeDataStructure		= {"id":"", "nodeType":"rewardQuest", "message":"", "soulsToReward":0, "objectToReward":""}
const playerGiveItemNodeDataStructure	= {"id":"", "nodeType":"playerGiveItemNode", "message":"", "item":""} 
const endNodeDataStructure				= {"id":"", "nodeType":"endNode", "message":""}

var nodes = []

#contains as dictionary all dialog
var dialogue = {}

var currentStartNode


const pathToJson = "res://Files/"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass


func _physics_process(delta):
	
	
	pass

#boton messageNode
func _on_messageNode_pressed():
	var messageNodeInstance = messageNode.instance()
	add_child(messageNodeInstance)
	nodes.push_back(messageNodeInstance.get_name())
	pass # Replace with function body.

#funcion conectar nodos
func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	connect_node(from, from_slot, to, to_slot)

#boto decision node
func _on_DecisionNode_pressed():
	var decisionNodeInstance = decisionNode.instance()
	add_child(decisionNodeInstance)
	nodes.push_back(decisionNodeInstance.get_name())

#boton quest node
func _on_QuestNode_pressed():
	var questNodeInstance = questNode.instance()
	add_child(questNodeInstance)
	nodes.push_back(questNodeInstance.get_name())

	
func _on_playerGetItemNode_pressed():
	print("here")
	var playerGetItemNodeInstance = playerGetItemNode.instance()
	add_child(playerGetItemNodeInstance)
	nodes.push_back(playerGetItemNodeInstance.get_name())
	pass # Replace with function body.	

#boton on quest complete node
func _on_questCompleteNode_pressed():
	var questCompleteNodeInstance = questCompleteNode.instance()
	add_child(questCompleteNodeInstance)
	nodes.push_back(questCompleteNodeInstance.get_name())


#boton on reward node
func _on_rewardQuestNode_pressed():
	var rewardQuestNodeInstance = rewardQuestNode.instance()
	add_child(rewardQuestNodeInstance)
	nodes.push_back(rewardQuestNodeInstance.get_name())

#boton npc give item node
func _on_npcGiveItemNode_pressed():
	var playerGiveItemNodeInstance = playerGiveItemNode.instance()
	add_child(playerGiveItemNodeInstance)
	nodes.push_back(playerGiveItemNodeInstance.get_name())

#boton end node
func _on_endNode_pressed():
	var endNodeInstance = endNode.instance()
	add_child(endNodeInstance)
	nodes.push_back(endNodeInstance.get_name())

#boton start node
func _on_startNode_pressed():
	var startNodeInstance = startNode.instance()
	add_child(startNodeInstance)
	nodes.push_back(startNodeInstance.get_name())
	currentStartNode = startNodeInstance
	
#export button
func _on_export_pressed():
	print("CONNECTIONS: ", get_connection_list(), "\n")
	var tempDataStructure
	var nodeToSave
	print("nodes", nodes)
	for node in nodes:
		
		var nodeObject = get_node(node)
		
		print("ttype", nodeObject.nodeType)
		match nodeObject.nodeType:
			
			"startNode":
				tempDataStructure = startNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass
			
			"messageNode":
				tempDataStructure = messageNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				dialogue[tempDataStructure.id] = tempDataStructure
				print("dig", dialogue)
				pass
			
			"decisionNode":
				tempDataStructure = decisionNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.decision1 = nodeObject.get_decision_1()
				tempDataStructure.decision2 = nodeObject.get_decision_2()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass
			
			"questNode":
				tempDataStructure = questNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.questToStart = nodeObject.get_quest_to_start()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass
				
			"playerGetItemNode":
				tempDataStructure = playerGetItemNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.item = nodeObject.get_item_from_npc()
				dialogue[tempDataStructure.id] = tempDataStructure
				print("DUIA", dialogue)
				pass
				
			"questCompleteNode":
				tempDataStructure = questCompleteNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.questToComplete = nodeObject.get_quest_to_complete()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass
				
			"rewardQuestNode":
				tempDataStructure = rewardQuestNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.soulsToReward = nodeObject.get_souls_to_reward()
				tempDataStructure.objectToReward = nodeObject.get_object_to_reward()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass		
			
			"npcGiveItemNode":
				tempDataStructure = playerGiveItemNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				tempDataStructure.item = nodeObject.get_item_to_give()
				dialogue[tempDataStructure.id] = tempDataStructure
				
				pass
				
			"endNode":
				tempDataStructure = endNodeDataStructure.duplicate()
				tempDataStructure.id = nodeObject.get_name()
				tempDataStructure.message = nodeObject.get_message()
				dialogue[tempDataStructure.id] = tempDataStructure
				pass
				
	#Parseamos la estructura de datos a json string	
	var jstr = JSON.print(dialogue)
	print("Dialogue: ", jstr)
	pass
	
	
	#exportamos el archivo
	var file = File.new()
	file.open(pathToJson + get_parent().get_node("fileName").get_text(), File.WRITE)
	file.store_string(jstr)
	file.close()
	pass
	
	
	 









