class JobsController < ApplicationController
  def index
    if params[:user_id]
      if !Job.exists?(params[:user_id])
        render json: { err_message: "User record not found." }, status: 404
      else
        jobs = Job.where(user_id: params[:user_id])
        render json: jobs.to_json(:methods => [:user], :include => :addresses), status: 200
      end
    elsif params[:messenger_id]
      if !Job.exists?(params[:messenger_id])
        render json: { err_message: "Messenger record not found." }, status: 404
      else
        jobs = Job.where(messenger: params[:messenger_id])
        render json: jobs.to_json(:methods => [:user], :include => :addresses), status:200
      end
    else
      if Job.count.nil?
        render json: { err_message: "No Jobs in queue." }, status: 404
      else
        jobs = Job.all
        render json: jobs.to_json(:methods => [:user], :include => :addresses), status: 200
      end
    end
  end

  def show
    if Job.exists?(params[:id])
      job = Job.find(params[:id])
      render json: job.as_json(:methods => [:user], :include => :addresses), status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create

    user = User.find_by user_name: params[:user_name]

    user.jobs.build({
      business_name:   params[:business_name],
      location:        params[:location],
      job_description: params[:job_description],
      phone:           params[:phone],
      status:          params[:status]
      })

    job = user.jobs.last

    job.addresses.build({
      street_name: params[:street_name],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip]
      })
    job.save!

    if user.save!
      assoc_1 = {:addresses => params}
      assoc_2 = {:jobs => params}

      render json: user.as_json(:include => {:addresses => assoc_1, :jobs => assoc_2, :jobs => {:include => :addresses}}), status: 200
    else
      render json: { err_message: "Job record already exists." }, status: 404
    end
  end

  def update
    if Job.exists?(params[:id])
      job = Job.find(params[:id])
      job.status = params[:status]
      render json: job.to_json, status: 200
    else
      render json: { err_message: "User record not found." }, status: 404
    end
  end

  def destroy
    if Job.exists?(params[:id])
      job = Job.find(params[:id])
      job.destroy
      render json: { message: "Job deleted from database."}, status: 200
    else
      render json: { err_message: "Job record not found." }, status: 404
    end
  end

end
