class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper :all
  helper_method :current_worker_session, :current_worker
  filter_parameter_logging :password, :password_confirmation

  private
    def current_worker_session
      return @current_worker_session if defined?(@current_worker_session)
      @current_worker_session = WorkerSession.find
    end
    
    def current_worker
      return @current_worker if defined?(@current_worker)
      @current_worker = current_worker_session && current_worker_session.record
    end
    
    def require_worker
      unless current_worker
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_worker_session_url
        return false
      end
    end

    def require_no_worker
      if current_worker
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
