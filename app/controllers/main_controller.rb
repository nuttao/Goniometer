class MainController < ApplicationController
	
  def index
  	if @current_user.role_id == Role::GENERAL_ID
  		redirect_to measures_path
  	else
  		redirect_to motions_path
  	end
  end
end
