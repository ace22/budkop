class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper :all
  helper_method :current_drone_session, :current_drone
  filter_parameter_logging :password, :password_confirmation

  private
    def current_drone_session
      return @current_drone_session if defined?(@current_drone_session)
      @current_drone_session = DroneSession.find
    end
    
    def current_drone
      return @current_drone if defined?(@current_drone)
      @current_drone = current_drone_session && current_drone_session.record
    end
    
    def require_drone
      unless current_drone
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_drone_session_url
        return false
      end
    end

    def require_no_drone
      if current_drone
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  
  
end
