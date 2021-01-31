class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update]

  def index
    # current_user.admin ? @jobs = Job.all : @jobs = Job.where(user: current_user)
    @jobs = policy_scope(Job)
    @new_job = Job.new
    @new_customer = Customer.new
  end

  def show
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      redirect_to @job, notice: "New Job has been created"
    else
      error_message = "#{@job.errors.messages.keys[0].capitalize} #{@job.errors.messages.values.flatten[0]}"
      redirect_to jobs_path, alert: error_message
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:customer_id, :car_model, :mileage, :problem)
  end
end
