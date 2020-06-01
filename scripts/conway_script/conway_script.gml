function Vec2( _x, _y ) constructor {
	x	= _x;
	y	= _y;
	
	function set( _x, _y ) {
		x	= _x;
		y	= _y;
	}
	function compare( _x, _y ) {
		return ( x == _x && y == _y );
		
	}
	
}
function ConwayPoint( _x, _y ) {
	x			= _x;
	y			= _y;
	neighbors	= array_create( 9, undefined );
	iAlive		= 0;
	bAlive		= false;
	
	function set_neighbor( _direction, _target ) {
		neighbors[ _direction ]	= _target;
		
	}
	function live() {
		for ( var _i = 0; _i < array_length( neighbors ); ++_i ) {
			if ( is_undefined( neighbors[ _i ] ) ) { continue; }
			
			neighbors[ _i ].iAlive	+= 1;
			
		}
		bAlive	= true;
		
	}
	function die() {
		for ( var _i = 0; _i < array_length( neighbors ); ++ _i ) {
			if ( is_undefined( neighbors[ _i ] ) ) { continue; }
			
			neighbors[ _i ].iAlive	-= 1;
			
		}
		bAlive	= false;
		
	}
	
}
function Grid( _w, _h ) constructor {
	var _x, _y;
	
	size	= _w * _h;
	stack	= ds_stack_create();
	array	= array_create( size, 0 );
	width	= _w;
	height	= _h;
	
	for ( var _i = 0; _i < size; ++_i ) {
		_x	= _i mod width;
		_y	= _i div width;
		
		array[ _i ]	= new ConwayPoint( _x, _y );
		
	}
	var _neighbor	= [ NEIGHBOR.LU, NEIGHBOR.UP, NEIGHBOR.RU, NEIGHBOR.LE, 0, NEIGHBOR.RI, NEIGHBOR.DL, NEIGHBOR.DO, NEIGHBOR.DR ];
	
	for ( var _i = 0; _i < size; ++_i ) {
		_x	= _i mod width;
		_y	= _i div width;
		
		for ( var _sy = -1; _sy <= 1; ++_sy ) {
			for ( var _sx = -1; _sx <= 1; ++_sx ) {
				if ( _sx == 0 && _sy == 0 ) { continue; }
				if ( _x + _sx < 0 || _x + _sx >= width ) { continue; }
				if ( _y + _sy < 0 || _y + _sy >= height ) { continue; }
				
				array[ _i ].set_neighbor( _neighbor[ ( _sx + 1 ) + ( _sy + 1 ) * 3 ], array[ ( _x + _sx ) + ( _y + _sy ) * width ] );
				
			}
			
		}
		
	}
	function flag_position( _x, _y, _alive ) {
		var _index	= _x + _y * width;
		
		if ( _x < 0 || _x >= width ) { return; }
		if ( _y < 0 || _y >= height ) { return; }
		
		flag_index( _index, _alive );
		
	}
	function flag_index( _index, _alive ) {
		if ( _index < 0 || _index >= size ) { return; }
		if ( array[ _index ].bAlive != _alive ) {
			ds_stack_push( stack, new Vec2( array[ _index ], _alive ) );
			
		}
		
	}
	function get_at_position( _x, _y ) {
		var _index	= _x + _y * width;
		
		if ( _x < 0 || _x >= width ) { return undefined; }
		if ( _y < 0 || _y >= height ) { return undefined; }
		
		return get_at_index( _index );
		
	}
	function get_at_index( _index ) {
		if ( _index < 0 || _index >= size ) { return undefined; }
		
		return array[ _index ];
		
	}
	function update() {
		while ( ds_stack_size( stack ) > 0 ) {
			var _next	= ds_stack_pop( stack );
			
			if ( _next.y == true ) {
				_next.x.live();
				
			} else {
				_next.x.die();
				
			}
			
		}
		
	}
	function destroy() {
		ds_stack_destroy( stack );
		
	}
	
}
enum NEIGHBOR {
	LU,
	UP,
	RU,
	LE,
	NO,
	RI,
	DL,
	DO,
	DR
}
