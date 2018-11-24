$(document).on('turbolinks:load', function() {
  $(".claims-list").on('click', ".status-btn", function(evt){
    evt.preventDefault();

    var self      = $(this);
    var url       = self.attr("href")
    var status    = self.attr("data-status")

    var data = {
      "status": status
    }

    var onDone = function (result) {
      console.log(result);
      self.text(I18n.t("app.status") + ": " + status )
    }

    var onFail = function( err ) {
      console.log( "Error --> ", err );
    }

    ajaxCall('patch', url, data, onDone, onFail, 'json');

  })
});

function ajaxCall ( mType, url, dataObj,doneCB, failCB, dataType) {
  var ajaxObj = {
    method: mType,
    url: url,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: dataObj,
    dataType: 'json'
  }
  $.ajax(ajaxObj)
  .done(doneCB)
  .fail(failCB);
}
