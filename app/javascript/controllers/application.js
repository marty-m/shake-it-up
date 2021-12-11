import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

$('search-field').keypress(function(e){
    if(e.which == 13){
        $(this).closest('form').othername();
    }
});

function othername() {
    var input = document.getElementById("userInput").value;
    alert(input);
}

export { application }
