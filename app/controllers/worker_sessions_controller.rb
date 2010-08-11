class WorkerSessionsController < ApplicationController
  before_filter :require_no_worker, :only => [:new, :create]
  before_filter :require_worker, :only => :destroy
  
  def new
    @worker_session = WorkerSession.new
  end


  def create
    @worker_session = WorkerSession.new(params[:worker_session])
    if @worker_session.save
      flash[:notice] = "Login successful!"
      redirect_to worker_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_worker_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
end

