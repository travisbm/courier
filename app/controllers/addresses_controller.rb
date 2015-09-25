class AddressesController < ApplicationController
  def index
    if params[:user_id]
      address = User.find(params[:user_id]).addresses
      render json: address.to_json, status: 200
    elsif params[:job_id]
      address = Job.find(params[:job_id]).addresses
      render json: address.to_json, status:200
    end
    render json: { err_message: "Record not found." }, status: 404
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
