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
      },
      "user[address_attributes][name]":{
        required: true
      },
      "user[address_attributes][city]":{
        required: true
      },
      "user[address_attributes][postal_code]":{
        required: true
      },
      "user[address_attributes][county]":{
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
      },
      "user[address_attributes][name]":{
        required: I18n.t("user.enter_val", {val: I18n.t("app.address") })
      },
      "user[address_attributes][city]":{
        required: I18n.t("user.enter_val", {val: I18n.t("address.city") })
      },
      "user[address_attributes][postal_code]":{
        required: I18n.t("user.enter_val", {val: I18n.t("address.postal_code") })
      },
      "user[address_attributes][county]":{
        required: I18n.t("user.enter_val", {val: I18n.t("address.county") })
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

  $('#myModal').on('click', '.modal-body .work-experience-form',  function() {
    $("#new_work_experience").validate({
      rules: {
        "work_experience[company_name]": {
          required: true
        },
        "work_experience[designation]": {
          required: true
        },
        "work_experience[location]": {
          required: true
        },
        "work_experience[responsibilities]": {
          required: true
        },
        "work_experience[from_date]": {
          required: true
        }
      },
      messages: {
        "work_experience[company_name]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("work_experience.company_name")})
        },
        "work_experience[designation]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("work_experience.designation")})
        },
        "work_experience[location]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("work_experience.location")})
        },
        "work_experience[responsibilities]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("work_experience.responsibilities")})
        },
        "work_experience[from_date]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.from_date")})
        }
      }
    });

    $("#new_education").validate({
      rules: {
        "education[field_of_study]": {
          required: true
        },
        "education[institution]": {
          required: true
        },
        "education[from_date]": {
          required: true
        },
        "education[to_date]": {
          required: true
        }
      },
      messages: {
        "education[field_of_study]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("education.field_of_study")})
        },
        "education[institution]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("education.institution")})
        },
        "education[from_date]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.from_date")})
        },
        "education[to_date]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.to_date")})
        }
      }
    });    

    $('#work_experience_currently_working').on('click', function(e){
      if ($(this).is(":checked")){
        $('#work_experience_to_date').val("")
      }
    });

    $('#work_experience_to_date').on('click change keyup keydown', function(e){
      $('#work_experience_currently_working').prop('checked', false);
    })

    $("#new_claim").validate({
      rules: {
        "claim[collection_area_id]": {
          required: true
        },
        "claim[amount]": {
          required: true
        },
        "claim[additional_desciption]": {
          required: true
        },
        "claim[debtor_attributes][name]": {
          required: true
        },
        "claim[debtor_attributes][city]": {
          required: true
        },
        "claim[debtor_attributes][address]": {
          required: true
        },
        "claim[debtor_attributes][postal_code]": {
          required: true
        }
      },
      messages: {
        "claim[collection_area_id]": {
          required:  I18n.t("app.select_claim_type")
        },
        "claim[amount]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.amount")})
        },
        "claim[additional_desciption]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("user.description")})
        },
        "claim[debtor_attributes][name]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.debtor_name")})
        },
        "claim[debtor_attributes][address]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("app.address")})
        },
        "claim[debtor_attributes][city]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("address.city")})
        },
        "claim[debtor_attributes][postal_code]": {
          required:  I18n.t("user.enter_val", {val: I18n.t("address.postal_code")})
        }
      }
    }); 

  });
});
