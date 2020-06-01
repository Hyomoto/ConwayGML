function new_message( _string ) {
	with ( oMessage ) {
		instance_destroy();
		
	}
	with ( instance_create_depth( 2 * Render.scale.width, Render.window.height - 32, 0, oMessage ) ) {
		myString	= _string;
		
	}
	
}
