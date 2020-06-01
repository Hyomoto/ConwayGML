if ( bUpdate ) {
	var _screen = new Vector( display_get_width(), display_get_height() );
	var _render	= Render.window;
	
	_screen.subtract( _render );
	_screen.divide( 2 );
	
	window_set_rectangle( _screen.width, _screen.height, _render.width, _render.height );
	
	surface_resize( application_surface, Render.screen.width, Render.screen.height );
	
	view_enabled	= true;
	view_visible[0]	= true;
	
	view_set_wport( 0, Render.window.width );
	view_set_hport( 0, Render.window.height );
	
	camera_set_view_size( view_camera[ 0 ], Render.screen.width, Render.screen.height );
	
	log( "New window: ", Render.window.width, "x", Render.window.height );
	
	bUpdate	= false;
	
}
