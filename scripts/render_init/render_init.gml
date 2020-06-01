room_instance_add( 0, 0, 0, oRender )

#macro Render	render_instance()

function Vector( _a, _b ) constructor {
	function set( _a, _b ) {
		width	= _a;
		height	= _b;
	}
	function add( _pair ) {
		if ( is_struct( _pair ) ) {
			width	+= _pair.width;
			height	+= _pair.height;
			
		} else {
			width	+= _pair;
			height	+= _pair;
			
		}
		
	}
	function subtract( _pair ) {
		if ( is_struct( _pair ) ) {
			width	-= _pair.width;
			height	-= _pair.height;
			
		} else {
			width	-= _pair;
			height	-= _pair;
			
		}
		
	}
	function multiply( _pair ) {
		if ( is_struct( _pair ) ) {
			width	*= _pair.width;
			height	*= _pair.height;
			
		} else {
			width	*= _pair;
			height	*= _pair;
			
		}
		
	}
	function divide( _pair ) {
		if ( is_struct( _pair ) ) {
			width	/= _pair.width;
			height	/= _pair.height;
			
		} else {
			width	/= _pair;
			height	/= _pair;
			
		}
		
	}
	function dump() {
		show_debug_message( string( width ) + ", " + string( height ) );
	}
	set( _a, _b );
	
}
function render_new() constructor {
	pixel	= new Vector( 1, 1 );
	screen	= new Vector( 256, 240 );
	window	= new Vector( screen.width, screen.height );
	scale	= new Vector( 1, 1 );
	render	= noone;
	attached= ds_list_create();
	
	function set_dimensions( _width, _height, _pixel_size ) {
		pixel.set( _pixel_size, _pixel_size );
		screen.set( _width, _height );
		window.set( _pixel_size * _width, _pixel_size * _height );
		
		with ( render ) { update(); }
			
	}
	function set_scale( _int ) {
		var _scale	= floor( ( display_get_height() * _int / pixel.height ) / screen.height );
		
		scale.set( _scale, _scale );
		window.set( pixel.width * screen.width * _scale, pixel.height * screen.height * _scale );
		
		with ( render ) { update(); }
			
	}
	function render_id( _set ) {
		if ( is_undefined( _set ) ) { return render; }
			
		render	= _set;
			
	}
	function attach( _id ) {
		var _index	= ds_list_find_index( attached, _id );
		
		if ( _index == -1 ) {
			ds_list_add( attached, _id );
			
		}
		
	}
	function detatch( _id ) {
		var _index	= ds_list_find_index( attached, _id );
		
		if ( _index > -1 ) {
			ds_list_delete( attached, _index );
			
		}
		
	}
	
}
function render_instance() {
	static instance	= new render_new();
	
	return instance;
	
}
