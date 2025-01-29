extends Node

@export var api_key: String = "YOUR_API_KEY"
var character_context: Dictionary = {}
var chat_history: Array = []

func set_character_context(context: Dictionary):
	character_context = context
	print("Character context set:", character_context)

func add_to_chat_history(user_message: String, ai_response: String):
	chat_history.append({"user": user_message, "ai": ai_response})
	print("Updated chat history:", chat_history)

func send_to_gpt(user_message: String):
	if api_key == "":
		push_error("API key not set!")
		return

	var request_body = {
		"userInput": user_message,
		"chatHistory": chat_history,
		"characterContext": character_context
	}
	var json_body = JSON.stringify(request_body)

	var headers = [
		"Content-Type: application/json",
		"Authorization: " + "Bearer " + api_key
	]
	
	print("Sending request to GPT API...")
	print("Request Body:", json_body)
	
	var http = HTTPRequest.new()
	add_child(http)
	
	# Send the HTTP request
	var error = http.request(
		"https://npc-gpt-api-04c6279a15ad.herokuapp.com/api/v1/chat/send-message",
		headers,
		HTTPClient.METHOD_POST,
		json_body
	)
	if error != OK:
		push_error("Failed to send request: %s" % error)
	else:
		print("Request sent successfully.")
		http.request_completed.connect(_on_gpt_response)

signal gpt_response_received(user_input: String, ai_response: String)

func _on_gpt_response(result: int, response_code: int, headers: Array, body: PackedByteArray):
	print("HTTP Response received. Result:", result, "Response Code:", response_code)
	if result != OK:
		push_error("HTTP request failed: %d" % result)
		return

	var response_text = body.get_string_from_utf8()
	print("Response Text:", response_text)

	var json = JSON.new()
	var response_json = json.parse(response_text)

	if response_json.error == OK:
		var data = response_json.result
		var user_input = data["userInput"]
		var ai_response = data["response"]["content"]

		print("Emitting signal with AI response...")
		emit_signal("gpt_response_received", user_input, ai_response)
	else:
		push_error("Failed to parse GPT response.")


func save_chat_history(file_path: String = "user://chat_history.json"):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(chat_history))
	file.close()

func load_chat_history(file_path: String = "user://chat_history.json"):
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		var json = JSON.new()
		var parse_result = json.parse(file.get_as_text())
		if parse_result.error == OK:
			chat_history = parse_result.result
		else:
			push_error("Failed to parse chat history: %s" % parse_result.error_string)
		file.close()
