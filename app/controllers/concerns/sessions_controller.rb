class SessionsController < ApplicationController
  def index
    if session[:admin_id]
      render json: {
               :ok => true,
               :admin_id => session[:admin_id],
               :username => session[:username],
             }
    else
      render json: { :ok => false }
    end
  end

  def create
    admin = Admin.find_by(username: params["username"])
    if not admin
      render json: { :ok => false }, status: 401
      return
    end
    if not admin.authenticate(params["password"])
      render json: { :ok => false }, status: 401
      return
    end
    session[:admin_id] = admin.id
    session[:username] = admin.username
    render json: { :ok => true, :admin_id => admin.id, :username => admin.username }
  end

  def destroy
    reset_session
  end
end
