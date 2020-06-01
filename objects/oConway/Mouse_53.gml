if ( stepMode ) {
	var _mx	= ( window_mouse_get_x() / Render.pixel.width ) div ( Render.scale.width );
	var _my	= ( window_mouse_get_y() / Render.pixel.height ) div ( Render.scale.height );
	var _point	= oGrid.get_at_index( _mx + _my * oGrid.width );
	
	oGrid.flag_position( _mx, _my, _point.bAlive ^ true );
	
}
