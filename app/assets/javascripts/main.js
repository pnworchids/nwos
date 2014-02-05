
// SETUP, MISC
(function($) {
    $(document).ready(function() {

        // Determines whether to use click events or touch events and returns appropriate event listener
        $.touchclick = Modernizr.touch ? "touchstart" : "click";
        $.mobile = $('html').hasClass('mobile');

        // Test for Input Attributes
        if (Modernizr.input.placeholder) {
            $('html').addClass('placeholder');
        }

        $(function() {
            $(".rslides").responsiveSlides({
                speed: 800,
                timeout: 5000,
                pager: true,
                nav: true,
                pause: true,
                prevText: '<i class="fa fa-chevron-left"></i> <span>Previous</span>',
                nextText: '<span>Next</span> <i class="fa fa-chevron-right"></i>'
            });
        });

    });

})( jQuery );

// GOOGLE MAPS
(function($) {
    $(document).ready(function() {
        $('[data-google-map]').simpleGMap();
    });

    $.fn.simpleGMap = function() {
        var maps = this;
        maps.each(function() {
            var mapTitle = $.trim($(this).text());
            var lat = $(this).data('lat');
            var lng = $(this).data('lng');
            var mapZoom = (typeof $(this).data('zoom') === "undefined") ? 12 : $(this).data('zoom');

            console.log($(this).data('zoom'));
            console.log(mapZoom);

            var LatLong = new google.maps.LatLng(lat, lng);
            //NOTE: google.maps.Map() cannot take a jquery object
            var mapCanvas = $(this).get(0);
            var mapOptions = {
                center: LatLong,
                zoom: mapZoom,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }

            var map = new google.maps.Map(mapCanvas, mapOptions);

            var marker = new google.maps.Marker({
                position: LatLong,
                map: map,
                title: mapTitle
            });
        });
    }

})( jQuery );

// CUSTOM FORM PLUGINS
(function($) { // make this friendly to other libraries
    $(document).ready(function() {
        $('form[data-validation]').validateForm().customElements();
    });

    // plugin for validating regular form.
    $.fn.validateForm = function(callback) {
        var form = this;
        var submit = form.find('input[type="submit"]');

        // Setup custom submit button
        var prepend_txt = (typeof submit.data('prepend') === "undefined") ? '' : submit.data('prepend');
        submit.after($('<a/>').attr('href', '').addClass('faux-submit-btn').html(prepend_txt + submit.val()));
        form.find('input[type="submit"]').hide();

        // Validate when custom submit button is clicked
        form.find('.faux-submit-btn').on($.touchclick, function(e){
            e.preventDefault();

            // validate form fields
            form.validateFields(callback);
        });

        // Validate indiviual field when focus is lost
        // form.find('.required').each(function(){
        //     var field = $(this);
        //     field.find('input, select, textarea').blur(function(){
        //         // validate form field
        //         console.log($(this));
        //         field.validateFields(function(){ console.log('no submitting'); });
        //     });
        // });

        return this;
    }

    $.fn.validateFields = function(callback) {
        var error_class = 'field_with_errors';
        var error_dialog_box = $('.error_messages');
        var errors = new Object();

        this.find('.required').each(function(){
            var field = $(this);
            var input = $(this).find('input, textarea');
            var select = $(this).find('select');
            var error_message = $(this).find('.field_error_message');
            var val = $.trim(input.val());
            var err = '';

            // check if its a select or set of selects
            if (select.length > 0) {
                select.each(function(){
                    if (!$(this).children(':selected').val()) {
                        err = 'please select from the drop-down list';
                        input = select;
                        return;
                    }
                });

            // check if its a checkbox
            } else if (input.is(':checkbox')) {
                if (input.is(':checked')) { err = 'please accept'; }

            // all other statements below assume the input is a text field of sorts

            // check if its an email
            } else if (field.hasClass('email')) {
                if (checkEmail(val)) { err = 'Please provide a valid email address.'; }

            // check if its a phone number
            } else if (field.hasClass('phone')) {
                if (checkPhone(val)) { err = 'Please provide a valid phone number.'; }

            // check if its a zipcode
            } else if (field.hasClass('zipcode')) {
                if (checkZip(val)) { err = 'Please provide a valid zip code.'; }

            // check if its blank
            } else if (!val) {
                err = 'Please complete this required field.';

            // check if its a file upload with media restrictions
            } else if (field.hasClass('media')) {
                if (checkMedia(val)) { err = 'Please select a file.'; }

            }
            if (!err) {
                // field is valid - make sure an error will not show 
                field.removeClass(error_class);
                error_message.html('');
            } else {
                // 1. add it to the list of errors
                errors[input.attr('id')] = err;
                // 2. add error class to html element
                field.addClass(error_class);
                // 3. display error message next to field
                if (error_message.length > 0) {
                    error_message.html(err);
                } else {
                    field.append($('<div/>').addClass('field_error_message').html(err));
                }

            }
        });

        // if there are no errors, continue on with form submission
        if ($.isEmptyObject(errors)) {
            error_dialog_box.html('');
            if (typeof callback == 'function') { // make sure the callback is a function
                callback.call(this); // brings the scope to the callback
            } else {
                this.submit();
            }
        }

        function checkEmail(v) {
            return v.match(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/) ? false : true;
        }
        function checkPhone(v) {
            return v.match(/(?:(?:(\s*\(?([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\)?\s*(?:[.-]\s*)?)([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/) ? false : true;
        }
        function checkMedia(v) {
            var ext = v.substr((v.lastIndexOf('.')+1)).toLowerCase();
            //console.log(ext);
            if (ext == 'mp4' || ext == 'mov' || ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
                return false;
            } else {
                error_messages.push("Upload file formats are restricted to jpg, jpeg, png, gif, mov, and mp4.")
                return true;
            }
        }
        function checkZip(v) {
            return v.match(/\d{5}(?:[-\s]\d{4})?/) ? false : true;
        }

        return this;
    }

    // plugin for custom form elements
    $.fn.customElements = function () {
        this.addClass('custom-elements');
        var selects = this.find('select');
        var checkboxes = this.find('input[type="checkbox"]');

        selects.each(function(i) {
            var select = $(this);
            var active = select.children().first().text();
            var wrapper = $('<div/>').addClass('custom-select-wrapper csw-'+i);
            var dropdown = $('<div/>').text(active).append('<span><i class="icon-caret-down"></i></span>').addClass('dropdown');
            if (!$('html').hasClass('lt-ie8')) {
                select.wrap(wrapper)
            }
            select.before(dropdown).addClass('custom');
        
            // whenever someone changes the invisible select box value, update the faux dropdown box
            select.on('change', function() {
                var dd = $(this).siblings('.dropdown');
                var selected = $(this).children(':selected');

                // sets the faux dropdown text to the select text
                dd.text(selected.text()).append('<span><i class="fa fa-caret-down"></i></span>');

                // add class if value is set
                if (selected.index() > 0) {
                    dd.addClass('value-selected');
                } else {
                    dd.removeClass('value-selected');
                }
            });

            // initiate change on load for values that are pre-selected or persisted on backend validation
            select.trigger('change');
        });

        checkboxes.each(function(i) {
            var checkbox = $(this);
            var wrapper = $('<div/>').addClass('custom-checkbox-wrapper cbw-'+i);
            var faux = $('<div/>').addClass('faux-checkbox');
            checkbox.wrap(wrapper).before(faux).addClass('custom');

            // check to see if any checkboxes default as checked, if so, faux check them
            if (checkbox.is(':checked')) {
                addCheck(faux, checkbox);
            }

            // whenever someone clicks the faux checkbox, update the real checkbox 
            faux.on($.touchclick, function(){
                if (checkbox.is(':checked')) {
                    removeCheck(faux, checkbox);
                } else {
                    addCheck(faux, checkbox);
                }
                // trigger change for any other scripts that 
                // may be checking when the checkbox is checked
                checkbox.change();
            });

            // whenever the checkbox changes
            checkbox.on('change', function(){
                if (checkbox.is(':checked')) {
                    addCheck(faux, checkbox);
                } else {
                    removeCheck(faux, checkbox);
                }
            });
        });

        function removeCheck(f, cb) {
            f.removeClass('checked');
            cb.prop('checked', '');
        }

        function addCheck(f, cb) {
            f.addClass('checked');
            cb.prop('checked', 'checked');
        }

        return this;
    }

    // plugin for custom file input
    $.fn.customFileInputs = function () {
        this.addClass('custom-file-inputs');
        var uploaders = this.find('input[type="file"]');
        var emptyText = 'No file selected'

        uploaders.each(function(){
            var uploader = $(this);
            var wrapper = uploader.parent('.custom-file-input-wrapper');
            //var wrapper = $('<div/>').addClass('custom-file-input-wrapper');
            var label_txt = uploader.data('label');
            var faux = $('<div/>').addClass('faux-file-input').html($('<span/>').text(label_txt));
            var faux_filename = $('<div/>').addClass('faux-file-name').text(emptyText);
            uploader.before(faux).before(faux_filename).addClass('custom');
            //uploader.wrap(wrapper).before(faux).addClass('custom');

            faux.on($.touchclick, function(){
                uploader.click();
            });

            uploader.on('change', function(){
                var arr = $(this).val().split(/[\\\/]/);
                var filename = arr[arr.length-1];
                filename.length > 0 ? faux_filename.text(filename) : faux_filename.text(emptyText)
            });
        });

        return this;
    }

})( jQuery );
