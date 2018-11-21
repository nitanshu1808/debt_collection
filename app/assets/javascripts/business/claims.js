$(document).on('click', '.claim-status', function(event){
  var self      = $(this);
  var Id        = self.attr("href")
  
  var data = {
    "status": self.attr('data-stop-name'),
    "id": ""
  }

  var onDone = function (result) {}

  var onFail = function( err ) {
    console.log( "Error --> ", err );
  }

  ajaxCall('get', 'index', data, onDone, onFail, 'json');
})

function ajaxCall ( mType, url, dataObj,doneCB, failCB, dataType) {
  var ajaxObj = {
    method: mType,
    url: url,
    data: dataObj,
    dataType: 'json'
  }
  $.ajax(ajaxObj)
  .done(doneCB)
  .fail(failCB);
}