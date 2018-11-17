class WorkExperienceController < ApplicationController
  include ProfileCompletion
  before_action :find_lawyer

  def new
    @work_experience = @lawyer.work_experiences.build
    render 'shared/new'
  end

  def create
    begin
      @work_experience = @lawyer.work_experiences.build(work_experience_params)
      @work_experience.save
    rescue Exception => e
      @work_experience.errors.add(:base, e)
    end
    render 'shared/create'
  end

  private
  def work_experience_params
    params.require(:work_experience).permit(:lawyer_id, :company_name, :designation, :location,
      :from_date, :to_date, :currently_working, :responsibilities)
  end
end
