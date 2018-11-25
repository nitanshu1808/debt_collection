class EducationController < ApplicationController
  include ProfileCompletion
  skip_before_action :verify_profile_completion
  before_action :find_lawyer
  def new
    @education = @lawyer.educations.build
    render_template
  end

  def create
    @education = @lawyer.educations.build(education_params)
    @education.save
    render_template
  end

  private
  def education_params
    params.require(:education).permit(:lawyer_id, :field_of_study,
                            :institution, :from_date, :to_date)
  end
end
