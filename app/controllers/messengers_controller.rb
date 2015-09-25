class MessengersController < ApplicationController
  def index
    messengers = Messenger.all
    render json: messengers.to_json
  end

  def show
    messenger = Messenger.find(params[:id])
    render json: messenger.to_json
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
