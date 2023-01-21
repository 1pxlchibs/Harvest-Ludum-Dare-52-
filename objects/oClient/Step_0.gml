switch(status){
	case "Connected.":
	with(oPlayer){
		// Initialize the command, returns a ds_map
		var command = net_cmd_init("move");

		// Optionally add data to the command
		command[? "x"] = x;
		command[? "y"] = y;

		// Send the command to the server
		net_cmd_send(command);
	}
	break;
}