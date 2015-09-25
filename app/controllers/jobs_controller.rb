class JobsController < ApplicationController
  def index
    if params[:user_id]
      jobs = User.find(params[:user_id]).jobs
      render json: jobs.to_json
    else
      jobs = Job.all
      render json: jobs.to_json
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
