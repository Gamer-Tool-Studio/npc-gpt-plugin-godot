# NPC- GPT Plugin for Godot  
*Version 1.0.0*  

## User Guide  

This guide will help you set up and use the **NPC-GPT Plugin for Godot** to integrate AI-driven character interactions into your game.  

---

## Table of Contents  

1. [Installation](#installation)  
2. [Setup](#setup)  
   - [Enable the Plugin](#enable-the-plugin)  
   - [Set the API Key](#set-the-api-key)  
3. [Usage](#usage)  
   - [Setting Up Character Context](#setting-up-character-context)  
   - [Sending User Input](#sending-user-input)  
   - [Handling AI Responses](#handling-ai-responses)  
   - [Saving and Loading Chat History](#saving-and-loading-chat-history)  
4. [Example Scene](#example-scene)  
5. [Troubleshooting](#troubleshooting)  
6. [FAQ](#faq)  
7. [Support](#support)  

---

## Installation  

1. Download the plugin from [Itch.io] or your preferred marketplace.  
2. Extract the contents to your project’s `res://addons` folder.  
3. Open your Godot project and follow the setup steps below.
4. Create an Account with Gamer Tool Studio and activate your API KEY (https://gamertoolstudio.com/)  

---

## Setup  

### Enable the Plugin  

1. In Godot, go to **Project → Project Settings → Plugins**.  
2. Locate **NPC GPT Plugin** in the list.  
3. Toggle the checkbox to enable the plugin.  

### Set the API Key  

1. Open the **GPTManager.gd** script.  
2. Set your NPC-GPT API key in the `api_key` property:  

   ```
   @export var api_key: String = "your_api_key_here"

   ```

## Usage

### Setting Up Character Context
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
The character context defines how the AI behaves and responds.

## Troubleshooting  

### Common Issues  

### No response from the API  
- Ensure your API key is valid.  
- Check your internet connection.  

### Plugin not showing in Project Settings  
- Verify the plugin is in the `addons/` folder.  
- Restart Godot if necessary.  

### Errors in the Output Panel  
- Read the error messages carefully.  
- Contact support if the issue persists.  

---

## FAQ  

**Q: Can I use this plugin in 3D projects?**  
**A:** Yes, the plugin works in both 2D and 3D projects.  

**Q: Is this plugin compatible with Godot 3.x?**  
**A:** No, the plugin requires Godot 4.3 or later.  

**Q: Do I need a Gamer Tool Studio subscription?**  
**A:** Yes, you need an active GTS API key to use the plugin.  

---

## Support  

If you encounter any issues or have questions, feel free to contact us at [support email] or visit our community forums.  

	
	
	
