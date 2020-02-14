$('#basicModal').on('show.bs.modal', function (event) {
                console.log (event);
                console.log ('we are showing');
                
                
                var button = $(event.relatedTarget) // Button that triggered the modal
                //var recipient = button.data('whatever') // Extract info from data-* attributes
                var widget = button.parent();
                console.log (widget);
                
                var bodyContent = widget.find('.widget_content').html();
                console.log (bodyContent);
                
                var bodyTitle = widget.find('.widget_title').html();
                console.log (bodyTitle);
                
                var bodyImage = widget.find('.widget_image');
                console.log (bodyImage);
                console.log (bodyImage.attr('src'));
                
                var modal = $(this);
                modal.find('.modal-title').text(bodyTitle);
                modal.find('.modal-body-content').replaceWith('<div class="modal-body-content">' + bodyContent + '</div>');
                console.log (modal.find('.modal-image').attr('src'));
                modal.find('.modal-image').attr('src', bodyImage.attr('src'));
        /*
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)*/
     })


$('*[data-href]').on('click', function() {
    window.location = $(this).data("href");
});
