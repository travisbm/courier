class AddressesController < ApplicationController
  def index
    if params[:user_id]
      if !Address.exists?(params[:user_id])
        render json: { err_message: "User record not found." }, status: 404
      else
        addresses = Address.where(user_id: params[:user_id])
        render json: addresses.to_json, status: 200
      end
    else params[:job_id]
      if !Address.exists?(params[:job_id])
        render json: { err_message: "Job address record not found." }, status: 404
      else
        addresses = Address.where(job_id: params[:job_id])
        render json: addresses.to_json, status:200
      end
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
