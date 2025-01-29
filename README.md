# NPC-GPT Plugin for Godot  
*Version 1.0.0*  

## Description  

The **NPC-GPT Plugin for Godot** allows game developers to integrate AI-driven character interactions into their games using the NPC-GPT API. This plugin simplifies the process of setting up character contexts, sending user input to the API, and displaying dynamic responses in-game, enhancing storytelling and player immersion.  

## Features  

- Define custom character contexts (e.g., personality, background, knowledge).  
- Send player inputs to the GPT API for real-time AI responses.  
- Receive and display AI-generated responses seamlessly.  
- Save and load chat histories for persistent conversations.  
- Fully customizable and easy to integrate into your project.  

## Installation  

1. Download the plugin zip file from [Itch.io] or your preferred marketplace.  
2. Extract the contents to your project’s `res://addons` folder.  
3. In Godot, go to **Project → Project Settings → Plugins**.  
4. Enable the **GPT Plugin** by toggling the checkbox.  
5. Create an account with Gamer Tool Studio (https://gamertoolstudio.com/) and activate your API KEY 

## Usage  

### 1. Setting Up Character Context  

Use the `set_character_context` method to define a character’s behavior and background:  

``` 
GPTManager.set_character_context({
	"name": "GPTWizard",
	"age": 100,
	"traits": "wise, mysterious, kind",
	"dialogue_style": "formal",
	"background_story": "A mystical entity protecting ancient knowledge.",
	"events_knowledge": "Knows about the ancient scroll in the Temple of Light.",
	"interests": "alchemy, ancient runes, storytelling"
})

```

### 2. Sending User Input

Send a player’s input to the GPT API using:

``` 
GPTManager.send_to_gpt("Hello, who are you?")  

```
### 3. Handling Responses

Connect to the gpt_response_received signal to handle the AI’s response:

```

GPTManager.gpt_response_received.connect(_on_gpt_response_received)

func _on_gpt_response_received(user_input: String, ai_response: String):
	print("User Input:", user_input)
	print("AI Response:", ai_response)
```

### 4. Saving and Loading Chat History

Save the current chat history:
	
```
GPTManager.save_chat_history()  

``` 
Load a saved chat history:

```
GPTManager.load_chat_history()  
print(GPTManager.chat_history)  

```

## Example Scene

An example scene is included in the tests/ folder. Open TestScene.tscn to see how the plugin works in a game environment.

## Documentation

You can check a complete user guide and API reference in our dedicated documentation: https://gamertoolstudio.gitbook.io/npc-gpt/plugin-user-guide/getting-started

## Compatibility

Godot Engine 4.3 or later.
Requires an active OpenAI GPT API key.
License
This plugin is distributed under the MIT License.

## Support
If you encounter issues or have questions, feel free to contact us at [support email] or visit our community forums.
