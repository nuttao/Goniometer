class ProfileController < ApplicationController
  def show
  	@profile = User.find(params[:id])
  end

  def edit
  end

  def form
  	@profile = User.find(params[:id])

  	respond_to do |format|
      format.js { render layout: false }
    end
  end

  def detail
  	@profile = User.find(params[:id])

  	respond_to do |format|
      format.js { render layout: false }
    end
  end 

  def update
  	@profile = User.find(params[:id])

  	respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to action: :show, id: @profile.id}
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :show, locals: {panel: 'profile-form'} }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:username, :crypted_password, :email, :role_id, :password, :password_confirmation, :image)
  end
end
