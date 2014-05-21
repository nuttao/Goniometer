class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :authenticate
  before_filter :current_user

  private

  def authenticate
		if request.format.html?
			redirect_to new_session_path if session[:user_id].nil?
			return false
		elsif request.format.json?
			if Session.where('user_id = ? and client_uid = ? and token = ?', params[:user_id], params[:client_uid], params[:token]).first.nil?
				render json: { success:false, message:'Authentication fail' }
			end
		end  	
  end

  def current_user
  	if request.format.html?
  		@current_user = User.find(session[:user_id]) if session[:user_id]
  	end
  end
end
