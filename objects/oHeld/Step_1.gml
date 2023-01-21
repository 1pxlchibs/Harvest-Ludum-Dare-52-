switch(item_struct.type){
	case "tool":
		with(oPlayer){
			other.track_array = get_hand_track(fsm.get_current_state());
		}
		x_offset = track_array[oPlayer.image_index].x;
		y_offset = track_array[oPlayer.image_index].y;
		angle = track_array[oPlayer.image_index].angle;
		image_index = 0;
	break;
	case "crop":
		y_offset = -24;
		angle = 0;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
	case "goods":
		y_offset = -20;
		angle = 0;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
	case "resource":
		y_offset = -20;
		angle = 0;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
	case "tech":
		y_offset = -20;
		angle = 0;
		with(oPlayer){
			hand_back = get_sprite("hold_hand_back");
			hand_front = get_sprite("hold_hand_front");
		}
	break;
}