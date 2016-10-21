var elixir = require( "coldbox-elixir" );

elixir( mix => {
    mix.browserSync( {
        proxy: "localhost:61200"
    } );
} );