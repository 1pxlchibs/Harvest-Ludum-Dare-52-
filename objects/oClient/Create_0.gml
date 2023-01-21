net_init();

username = "Unnamed";
registered = false;
messageOfTheDay = "No MotD";
status = "Idle";
connecting = false;
clientId = 1;


net_cmd_add_handler("register", function(data) {
	username = data[? "username"];
	registered = data[? "registered"];
	status = "Registered. Press <space> to disconnect.";
});

net_cmd_add_handler("welcome", function(data) {
	messageOfTheDay = data[? "motd"];
	
	show_message("Message of the day:\n" + messageOfTheDay);
	var username = get_string("Connected! Enter a username.", "Player 1");
	status = "Registering...";
	
	var cmd = net_cmd_init("register");
	cmd[? "username"] = username;
	net_cmd_send(cmd);
});

net_cmd_add_handler("disconnected", function() {
	status = "Gracefully disconnected.";
});

net_cmd_add_handler("dropped", function() {
	status = "Connection abruptly dropped.";
});

net_cmd_add_handler("connectFailed", function() {
	status = "Failed to connect.";
	connecting = false;
});

net_cmd_add_handler("connected", function() {
	connecting = false;
	status = "Connected.";
});

net_cmd_add_handler("joinedServer", function(data){
	clientId = data[? "clientId"];
});

net_cmd_add_handler("newPlayer", function(data){
	var _clientAmount = data[? "clientAmount"];
	for(var i = 1; i <= _clientAmount; i++;){
		if (i == other.clientId){
			continue;
		}
		if (instance_exists(oPlayer2)){
			with(oPlayer2){
				if (i == clientId){
					continue;
				}
			}
		}
		with(instance_create_depth(327,170,-170,oPlayer2)){
			clientId = i;
		}
	}
	if (_clientAmount > 1){
		if (clientId != 1){
			
		}
	}
});

net_cmd_add_handler("move", function(data){
	with(oPlayer2){
		if (clientId = data[? "clientId"]){
			x = data[? "x"];
			y = data[? "y"];
		}
	}
});


alarm[0] = 10;