class JobsController < ApplicationController
  def index
    if params[:user_id]
      jobs = User.find(params[:user_id]).jobs
      render json: jobs.to_json, status: 200
    elsif params[:messenger_id]
      jobs = Messenger.find(params[:messenger_id]).jobs
      render json: jobs.to_json, status:200
    else
      jobs = Job.all
      render json: jobs.to_json, status: 200
    end
    render json: { err_message: "Record not found." }, status: 404
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.create(
      business_name: params[:business_name],
      location: params[:location],
      job_description: params[:job_description]),
      phone: params[:phone])

    if job.save!
      render json: user.to_json, status: 200
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
  end
end
