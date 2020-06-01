draw_surface_stretched( application_surface, 0, 0, Render.window.width, Render.window.height );

var _objects	= Render.attached;
var _i			= 0;

repeat ( ds_list_size( _objects ) ) {
	with ( _objects[| _i++ ] ) {
		event_perform( ev_draw, 0 );
		
	}
	
}
