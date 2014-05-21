class SessionsController < ApplicationController
  layout false

  skip_before_action :authenticate, only: [:index, :new, :create, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show

  end

  # GET /sessions/new
  def new

  end

  # POST /sessions
  # POST /sessions.json
  def create
    reset_session
    params[:user] ||= {}
    username = params[:user][:username].to_s
    password = params[:user][:password].to_s
    user = User.where('username = ? and crypted_password = ?', username, User.encrypt(password)).first

    params[:client_uid] = 'Web Platform' if request.format.html?
    
    if user && params[:client_uid]
      session_obj = Session.create(user_id:user.id, client_uid:params[:client_uid])
      session[:app_session_id] = session_obj.id
      session[:user_id] = user.id

      if request.format.html?
        redirect_to controller: 'main'
      elsif request.format.json?
        render json: {success: true, session: session_obj.to_json}
      end
    else
      if request.format.html?
        flash[:alert] = "Cannot login, please try again"
        render action: 'new'
      elsif request.format.json?
        render json: {success: false, message: 'Cannot login, please try again'}
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    Session.delete(params[:id])
    reset_session

    if request.format.html?
      redirect_to "/sessions/new"
    elsif requeset.format.json?
      render json: {success: true}
    end
  end
end
