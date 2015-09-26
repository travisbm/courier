class AddressesController < ApplicationController
  def index
    if params[:user_id]
      address = Address.where(user_id: params[:user_id])
      render json: address.to_json, status: 200
    elsif params[:job_id]
      address = Address.where(job_id: params[:job_id])
      render json: address.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
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
