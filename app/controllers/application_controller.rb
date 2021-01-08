class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def check_auth
    if not session[:admin_id]
      render json: { error: "Authentication needed" }, status: 401
    end
  end
end
