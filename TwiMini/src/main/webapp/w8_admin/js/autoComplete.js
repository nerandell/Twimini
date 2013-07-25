var autocomplete = $('#nav-search-input').typeahead()
    .on('keyup', function(ev){

        ev.stopPropagation();
        ev.preventDefault();

        console.log("In search function")
        //filter out up/down, tab, enter, and escape keys
        if( $.inArray(ev.keyCode,[40,38,9,13,27]) === -1 ){

            var self = $(this);

            //set typeahead source to empty
            self.data('typeahead').source = [];

            //active used so we aren't triggering duplicate keyup events
            if( !self.data('active') && self.val().length > 0){

                self.data('active', true);

                //Do data request. Insert your own API logic here.
                $.getJSON("/MiniTwitter/API/users/search?query="+$(this).val(),function(data) {

                    console.log(data.length);
                    //set this to true when your callback executes
                    self.data('active',true);

                    //Filter out your own parameters. Populate them into an array, since this is what typeahead's source requires
                    var arr = [],
                        i=data.length;
                    while(i--){
                        arr[i] = data[i].username;
                    }

                    //set your results into the typehead's source
                    self.data('typeahead').source = arr;

                    //trigger keyup on the typeahead to make it search
                    self.trigger('keyup');

                    //All done, set to false to prepare for the next remote query.
                    self.data('active', false);

                });

            }
        }
    });