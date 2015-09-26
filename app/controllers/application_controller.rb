class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  before_filter :cors_preflight_check

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
      headers['Content-Type'] = ''

     head :ok, :content_type => '',
 :content_disposition => nil,
 :x_sendfile => nil,
 :content_transfer_encoding => 'binary'
    end
  end

  def cors_options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    headers['Access-Control-Max-Age'] = '1728000'
    headers['Content-Type'] = ''

head :ok, :content_type => '',
 :content_disposition => nil,
 :x_sendfile => nil,
 :content_transfer_encoding => 'binary'
  end

  def not_found
   render json: { message: 'Requested route not found' }, status: 404
  end
end
