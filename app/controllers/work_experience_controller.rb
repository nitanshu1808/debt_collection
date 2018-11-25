class WorkExperienceController < ApplicationController
  include ProfileCompletion
  skip_before_action :verify_profile_completion
  before_action :find_lawyer

  def new
    @work_experience = @lawyer.work_experiences.build
    render_template
  end

  def create
    @work_experience = @lawyer.work_experiences.build(work_experience_params)
    @work_experience.save
    render_template
  end

  private
  def work_experience_params
    params.require(:work_experience).permit(:lawyer_id, :company_name, :designation, :location,
      :from_date, :to_date, :currently_working, :responsibilities)
  end
end
