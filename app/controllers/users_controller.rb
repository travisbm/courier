class UsersController < ApplicationController
  def index
    if User.count.nil?
      render json: { err_message: "No Users in queue." }, status: 404
    else
      users = User.all
      render json: users.to_json, status: 200
    end
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])

      render json: user.to_json({ :jobs => { :include => :addresses }, addresses: => {}
      }), status: 200


      # render json: user.to_json(:include => { :jobs => {
      #                                           :include => :addresses }
      # }), status: 200
    else
      render json: { err_message: "User record not found." }, status: 404
    end
  end

  def create
    user = User.new(
      first_name:    params[:first_name],
      last_name:     params[:last_name],
      user_name:     params[:user_name],
      business_name: params[:business_name],
      location:      params[:location],
      phone:         params[:phone])

    user.addresses.build({
      street_name: params[:street_name],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip]
      })

    if user.save!
      render json: user.to_json(:include => :addresses), status: 200
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update

  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      user.destroy
      render json: { message: "User deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
