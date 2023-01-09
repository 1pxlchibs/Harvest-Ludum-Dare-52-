depth = -y;

mask_index = get_sprite("idle");

gtfo(oParentCollider);

if (!oHud.showInventory && !oDropbox.showInventory && !oController.dayEnded){
fsm.step();

fsm.trigger("t_idle");
fsm.trigger("t_run");
}