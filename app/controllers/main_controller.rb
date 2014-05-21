class MainController < ApplicationController

  skip_before_action :authenticate, only: [:template]
	
  def index
  	if @current_user.role_id == Role::GENERAL_ID
  		redirect_to measures_path
  	else
  		redirect_to motions_path
  	end
  end

  def template
  	redirect_to "/template/index.html"
  end
end
