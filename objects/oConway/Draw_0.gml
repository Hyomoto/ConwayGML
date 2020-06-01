if ( bUpdate ) {
	var _i = 0;
	var _point;
	
	draw_clear( c_black );
	
	repeat( oGrid.size ) {
		_point	= oGrid.get_at_index( _i  );
		
		if ( _point.bAlive ) {
			draw_sprite( gfx_point, 1, _point.x, _point.y );
			
		}
		++_i;
		
	}
	bUpdate	= false;
	
}
repeat( ds_stack_size( drawStack ) ) {
	var _point	= ds_stack_pop( drawStack );
	
	draw_sprite( gfx_point, _point.y, _point.x.x, _point.x.y );
	
}
