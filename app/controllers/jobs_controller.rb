class JobsController < ApplicationController
  def index
    jobs = User.find(params[:user_id]).jobs
    render json: jobs.to_json
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
