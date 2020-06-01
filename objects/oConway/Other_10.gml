/// @desc update conway
var _i	= oStartAt;
var _alive;

repeat( min( oGrid.size - oStartAt, oMaxAt ) ) {
	var _point	= oGrid.get_at_index( _i );
	
	_alive	= _point.iAlive;
	
	if ( _alive < 2 ) {
		oGrid.flag_index( _i, false );
		
	} else if ( _alive == 3 ) {
		oGrid.flag_index( _i, true );
		
	} else if ( _alive > 3 ) {
		oGrid.flag_index( _i, false );
		
	}
	++_i;
	
}
if ( _i < oGrid.size ) {
	oStartAt	= _i;
	
} else {
	oStartAt	= 0;
	oFinish		= true;
	
}
