extends Node

const save_path = "user://save_file.json"

var mute := false
var levels_unlocked := 0


func save_settings():
	var save_data: Dictionary = {
		"mute": mute,
		"levels_unlocked": levels_unlocked,
	}
	var json_string = JSON.stringify(save_data)

	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	
func load_settings():
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		var json_string = save_file.get_line()
		save_file.close()
		
		var save_data = JSON.parse_string(json_string)
		
		if "mute" in save_data:
			mute = save_data.mute
		if "levels_unlocked" in save_data:
			levels_unlocked = save_data.levels_unlocked
