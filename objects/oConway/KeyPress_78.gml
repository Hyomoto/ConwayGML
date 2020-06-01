/// @desc New Field
if ( keyboard_check( vk_control ) == false ) { exit; }

new_message( "New field created." );

oGrid.destroy();

start();
pause();
