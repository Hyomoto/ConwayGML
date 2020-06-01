function start() {
	oGrid		= new Grid( gWidth, gHeight );
	
	oStartAt	= 0;
	oMaxAt		= gWidth * gHeight / iUpdateSpeed;
	oFinish		= true;
	stepMode	= true;
	
	bUpdate		= true;
	
	timeTick	= 0;
	timeTock	= ceil( oGrid.size / oMaxAt ) + 1;
	
	ds_stack_clear( drawStack );
	
}
function pause() {
	window_set_caption( "Conway is paused" );
	
	stepMode	= true;
	
}
function unpause() {
	window_set_caption( "Conway is unpaused" );
	
	stepMode	= false;
	
}
lastPosition	= -1;
drawStack		= ds_stack_create();

start();
pause();

show_debug_overlay( bDebug );
