if ( oFinish == false ) {
	event_user( 0 );
	
}
if ( ++timeTick == timeTock ) {
	// do stuff
	ds_stack_copy( drawStack, oGrid.stack );
	
	oGrid.update();
	
	visible	= true;
	
	oFinish		= stepMode;
	
	timeTick	= 0;
	oStartAt	= 0;
	
} else {
	visible	= false;
	
}
