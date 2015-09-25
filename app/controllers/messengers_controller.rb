class MessengersController < ApplicationController
  def index
    messengers = Messenger.all
    render json: messengers.to_json, status: 200
  end

  def show
    if User.exists?(params[:id])
      messenger = Messenger.find(params[:id])
      render json: messenger.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
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
