class WorkersController < ApplicationController
  before_filter :require_no_worker, :only => [:new, :create]
  before_filter :require_worker, :only => [:show, :edit, :update]
  before_filter :set_worker

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @worker.update_attributes(params[:worker])
        redirect_to(worker_path, :notice => 'Worker was successfully update.')
      else
        @worker = current_worker
        render :action => 'edit', :id => current_worker.id
      end
    end
  end

  private

    def set_worker
      @worker = current_worker
    end
end
