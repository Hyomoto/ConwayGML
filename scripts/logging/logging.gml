function log() {
	var _string	= "";
	var _i	= 0;
	
	repeat ( argument_count ) {
		_string	+= string( argument[ _i++ ] );
		
	}
	show_debug_message( _string );
	
}
function logCSV() {
	var _string	= "";
	var _i	= 0;
	
	repeat ( argument_count ) {
		if ( _i != 0 ) { _string += ", "; }
		
		_string	+= string( argument[ _i++ ] );
		
	}
	show_debug_message( _string );
	
}
