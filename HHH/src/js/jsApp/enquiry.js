$('#sendEquiry').click(function(){
    var requestData =
    {
        user_name : $('#user_name').val(),
        user_last_name : $('#user_last_name').val()
    };
    var requestJson = JSON.stringify(requestData);
    addEnquiry(requestJson, function(response){
        console.log(response);
    }, function(error){
        console.log(error);
    });

});

function addEnquiry(requestData, success, failure){
    var settings = {
        'crossDomain': true,
        'url': 'http://localhost:8080/addEnquiry',
        'method': 'POST',
        'xhrFields': {
            'withCredentials': false
        },
        'headers': {
            'Content-Type': 'application/json; charset=utf-8',
            'dataType': 'json',
            'Cache-Control': 'no-cache',
            'Access-Control-Allow-Credentials': true,
            'Access-Control-Allow-Methods': 'POST',
            'Access-Control-Allow-Origin': 'http://localhost:8080/addEnquiry'
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

/*
function api_addBulletinComments(id, requestData, success, failure) {
    getUser(activeUser.username, function(result){
        var settings = {
         "async": true,
         "crossDomain": true,
         "url": "https://api.guardianims.com/api/v1/Bulletin/" + id.toString() + '/comment',
         "method": "POST",
         "headers": {
           "Content-Type": "application/x-www-form-urlencoded",
           "Authorization": "Bearer " + result.accessToken,
           "Cache-Control": "no-cache",
       },
        "data": null
       };

       settings.data = requestData;
        console.log('setting add buletin comment',settings);
        $.ajax(settings).done(function (response) {
            console.log('comments added',response);

            success(response)
        }).fail(function(error){
            console.log('error addin comment', error);
            failure(error.responseJSON.message);
        });
    }, function(error){
        failure(error);
    });
}


 */


