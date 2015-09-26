class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  after_filter :remove_charset

  def cors_options
    puts "test cors_options"
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => ''
  end

  def remove_charset
    puts "test remove_charset"
    headers.delete('Content-Type')
    puts headers
  end

  def not_found
   render json: { message: 'Requested route not found' }, status: 404
  end
end
