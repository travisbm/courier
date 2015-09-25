class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json, status: 200
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user.to_json(:include => { :jobs => {
                                                :include => :addresses }
      }), status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
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
