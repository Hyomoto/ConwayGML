/// @desc Load File
if ( keyboard_check( vk_control ) == false ) { exit; }

var _file	= get_save_filename( "*.txt", "conway.txt" );
var _string	= "";

if ( _file == "" ) { exit; }

_file	= file_text_open_write( _file );

var _i	= 0;
var _w	= 0;
var _point;

repeat( oGrid.size ) {
	_point	= oGrid.get_at_index( _i++ );
	
	file_text_write_string( _file, ( _point.bAlive ? "1" : "0" ) );
	
	if ( ++_w == oGrid.width ) {
		file_text_writeln( _file );
		
		_w	= 0;
		
	}
	
}
new_message( "File saved." );

file_text_close( _file );
