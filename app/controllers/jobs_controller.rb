class JobsController < ApplicationController
  before_filter :cors_preflight_check

  def cors_preflight_check
    logger.debug "cors is running"
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

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
    #render json: { err_message: "Record not found." }, status: 404
  end

  def show
    if Job.exists?(params[:id])
      job = Job.find(params[:id])
      render json: job.to_json(:include => :addresses), status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create
    job = Job.new(
      business_name: params[:business_name],
      location: params[:location],
      job_description: params[:job_description],
      phone: params[:phone])

    job.addresses.build({
      street_name: params[:street_name],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip]
      })

    if job.save!
      render json: job.to_json, status: 200
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
    if Job.exists?(params[:id])
      job = Job.find(params[:id])
      job.destroy
      render json: { message: "Job deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
