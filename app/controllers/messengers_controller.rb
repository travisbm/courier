class MessengersController < ApplicationController
  def index
    messengers = Messenger.all
    render json: messengers.to_json, status: 200
  end

  def show
    if Messenger.exists?(params[:id])
      messenger = Messenger.find(params[:id])
      render json: messenger.to_json(:include => :jobs), status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create
    messenger = Messenger.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      user_name: params[:user_name],
      transit_type: params[:transit_type],
      location: params[:location],
      phone: params[:phone])

    if messenger.save!
      render json: messenger.to_json, status: 200
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
  end
end
