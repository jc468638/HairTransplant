/* eslint-disable no-undef,no-console */
//dropzone configuration
Dropzone.autoDiscover = false;
var myDropzone = new Dropzone('#myDropzone', {
    url: 'http://localhost:8080/fileUpload',
    autoProcessQueue: false,
    init: function (e) {

        var myDropzone = this;

        // Event to send your custom data to your server
        myDropzone.on('sending', function(file, xhr, data) {

        // First param is the variable name used server side
        // Second param is the value, you can add what you what
        // Here I added an input value
            //  data.append('your_variable', $('#your_input').val());
            console.log('sending');
        });

    }
});


$('#sendEquiry').click(function(){
    var weightValue = $('#weightValue').val();
    var weightUnit =  $('#weightUnit option:selected').val();
    var weightInGrams;
    if (weightUnit == 'kg'){
        weightInGrams = weightValue * 100;
    } else {
        weightInGrams = weightValue;
    }

    var requestData =
    {
        user_name : $('#user_name').val(),
        user_last_name : $('#user_last_name').val(),
        user_email : $('#email').val(),
        user_phone: $('#phone').val(),
        user_sex:  $('#sex option:selected').val(),
        user_weight: weightInGrams,
        enquiry_title: 'Quotation Request',
        enquiry_message: $('#message').val()

    };
    var requestJson = JSON.stringify(requestData);
    console.log('Json to Submit',requestJson);
    addEnquiry(requestData, function(response){
        console.log('response' ,response);
        if (response > 0){
            $('#enquiryFormContainer').html(alertSuccess('Your enquiry have been sent'));
            $('#enquiryFormContainer').append(thanksYouHtml());
            myDropzone.processQueue(); // Tell Dropzone to process all queued files.
        }
    }, function(error){
        console.log(error);
    });

});

function addEnquiry(requestData, success, failure){
    var settings = {
        'crossDomain': true,
        'url': 'http://localhost:8080/addEnquiry',//'http://127.0.0.1:8080/addEnquiry',
        'method': 'POST',
        'xhrFields': {
            'withCredentials': false
        },
        'headers': {
            //'Content-Type': 'application/json; charset=utf-8'
            'Content-Type': 'application/x-www-form-urlencoded'

        },
        'data': null
    };
    settings.data = requestData;
    console.log('setting add enquiry',settings);
    $.ajax(settings).done(function (response) {
        console.log('enquiry added',response);
        success(response);
    }).fail(function(error){
        console.log('error adding enquiry', error);
        failure(error);
    });
}


function thanksYouHtml(){
    var thankYouContent =
  '<h2 class="text-center title">Thank you for your enquiry</h2>' +
  '<h4 class="text-center description">An expert team will contanct you soon.</h4>' +
      '<div class="row">'+
    '<div class="col-md-4 ml-auto mr-auto text-center">'+
      '<a href="index.html"  class="btn btn-primary btn-raised btn-lg">' +
        '<i class="material-icons"> home </i> Back to Home' +
      '</a>'+
   ' </div>'+
    '</div>';

    return thankYouContent;
}

