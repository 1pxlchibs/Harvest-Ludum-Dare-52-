switch(item_struct.type){
	case "tool":
		with(oPlayer){
			if (fsm.get_current_state() = "idle" || fsm.get_current_state() = "run"){
				other.track_array = get_hand_track(fsm.get_current_state());
			}
		}
		x_offset = track_array[oPlayer.image_index].x;
		y_offset = track_array[oPlayer.image_index].y;
		image_index = 0;
	break;
	case "crop":
		y_offset = -24;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
	case "goods":
		y_offset = -20;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
	case "tech":
		y_offset = -20;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
}