class MessengersController < ApplicationController

  def index
    if Messenger.count.nil?
      render json: { err_message: "No Messengers in queue." }, status: 404
    else
      messengers = Messenger.all
      render json: messengers.to_json, status: 200
    end
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
    if Messenger.exists?(params[:id])
      messenger = Messenger.find(params[:id])
      messenger.destroy
      render json: { message: "Messenger deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

end
