$(document).on('turbolinks:load', function() {
  $("#new_user, #edit_user").validate({
    rules: {
      "user[user_name]": {
        required: true,
        maxlength: 30
      },
      "user[email]": {
        required: true
      },
      "user[name]": {
        required: true,
        maxlength: 50
      },
      "user[password]":{
        required: true
      },
      "user[description]":{
        required: true
      },
      "user[contact_number]":{
        required: true
      }

    },
    messages: {
      "user[user_name]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.user_name")}),
          maxlength: I18n.t("user.character_validation", {val: I18n.t("user.user_name"), num: 30})
      },
      "user[name]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.name")}),
          maxlength: I18n.t("user.character_validation", {val: I18n.t("user.name"), num: 50})
      },
      "user[password]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.password")})
      },
      "user[email]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.email")})
      },
      "user[description]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.description")})
      },
      "user[contact_number]":{
          required: I18n.t("user.enter_val", {val: I18n.t("user.contact_number") })
      }

    }
  });

  setTimeout(function(){
    $('.flash-msg').slideUp(800);
  }, 3000);

  function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.avatar').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
  }

  $("#user_profile_image").change(function(){
      readURL(this);
  });

});
