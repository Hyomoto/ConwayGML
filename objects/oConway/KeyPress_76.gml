/// @desc Load File
if ( keyboard_check( vk_control ) == false ) { exit; }

var _file	= get_open_filename( "*.txt", "conway.txt" );
var _string	= "";

if ( _file == "" ) { exit; }

_file	= file_text_open_read( _file );

while ( file_text_eof( _file ) == false ) {
	_string	+= file_text_read_string( _file );
	
	file_text_readln( _file );
	
}
file_text_close( _file );

oGrid.destroy();

start();
pause();

var _i	= 0;

repeat( min( oGrid.size, string_length( _string ) ) ) {
	if ( string_char_at( _string, _i ) == "1" ) {
		oGrid.array[ _i ].live();
		
	}
	++_i;
	
}
new_message( "File loaded." );
//log( "Entries: ", string_length( _string ) );
