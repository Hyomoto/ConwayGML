var _p		= timeTick / timeTock;

draw_set_alpha( animcurve_channel_evaluate( myCurve, _p ) );

draw_text( x, y, myString );

draw_set_alpha( 1.0 );
