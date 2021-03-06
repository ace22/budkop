require 'spec_helper'

describe WorkersController do

  def mock_worker(stubs={})
    @mock_worker ||= mock_model(Worker, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all workers as @workers" do
      Worker.stub(:all) { [mock_worker] }
      get :index
      assigns(:workers).should eq([mock_worker])
    end
  end

  describe "GET show" do
    it "assigns the requested worker as @worker" do
      Worker.stub(:find).with("37") { mock_worker }
      get :show, :id => "37"
      assigns(:worker).should be(mock_worker)
    end
  end

  describe "GET new" do
    it "assigns a new worker as @worker" do
      Worker.stub(:new) { mock_worker }
      get :new
      assigns(:worker).should be(mock_worker)
    end
  end

  describe "GET edit" do
    it "assigns the requested worker as @worker" do
      Worker.stub(:find).with("37") { mock_worker }
      get :edit, :id => "37"
      assigns(:worker).should be(mock_worker)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created worker as @worker" do
        Worker.stub(:new).with({'these' => 'params'}) { mock_worker(:save => true) }
        post :create, :worker => {'these' => 'params'}
        assigns(:worker).should be(mock_worker)
      end

      it "redirects to the created worker" do
        Worker.stub(:new) { mock_worker(:save => true) }
        post :create, :worker => {}
        response.should redirect_to(worker_url(mock_worker))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved worker as @worker" do
        Worker.stub(:new).with({'these' => 'params'}) { mock_worker(:save => false) }
        post :create, :worker => {'these' => 'params'}
        assigns(:worker).should be(mock_worker)
      end

      it "re-renders the 'new' template" do
        Worker.stub(:new) { mock_worker(:save => false) }
        post :create, :worker => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested worker" do
        Worker.should_receive(:find).with("37") { mock_worker }
        mock_worker.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :worker => {'these' => 'params'}
      end

      it "assigns the requested worker as @worker" do
        Worker.stub(:find) { mock_worker(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:worker).should be(mock_worker)
      end

      it "redirects to the worker" do
        Worker.stub(:find) { mock_worker(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(worker_url(mock_worker))
      end
    end

    describe "with invalid params" do
      it "assigns the worker as @worker" do
        Worker.stub(:find) { mock_worker(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:worker).should be(mock_worker)
      end

      it "re-renders the 'edit' template" do
        Worker.stub(:find) { mock_worker(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested worker" do
      Worker.should_receive(:find).with("37") { mock_worker }
      mock_worker.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the workers list" do
      Worker.stub(:find) { mock_worker(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(workers_url)
    end
  end

end
