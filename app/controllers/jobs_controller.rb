class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update]

  def index
    current_user.admin ? @jobs = Job.all : @jobs = Job.where(user: current_user)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
  end
end
