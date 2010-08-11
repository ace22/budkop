require 'spec_helper'

describe "workers/index.html.erb" do

  before do
    @worker1 ||= mock_worker
    @worker2 ||= mock_worker
    assign(:workers, [@worker1, @worker2])
    render
  end

  it 'should have h1 with description' do
    rendered.should have_selector('h1', :content => 'Listing workers')
  end

  it 'should have column header Nickname' do
    rendered.should have_selector('table > tr > th', :content => 'Nickname')
  end

  it 'should have column header Name' do
    rendered.should have_selector('table > tr > th', :content => 'Name')
  end

  it 'should have column header Surname' do
    rendered.should have_selector('table > tr > th', :content => 'Surname')
  end
 
  it 'should have column header Email' do
    rendered.should have_selector('table > tr > th', :content => 'Email')
  end
 
  it 'should have column header Description' do
    rendered.should have_selector('table > tr > th', :content => 'Description')
  end

  it 'should have first worker nickname' do
    rendered.should have_selector('table > tr > td', :content => @worker1.nickname)
  end

  it 'should have first worker name' do
    rendered.should have_selector('table > tr > td', :content => @worker1.name)
  end

  it 'should have first worker surname' do
    rendered.should have_selector('table > tr > td', :content => @worker1.surname)
  end

  it 'should have first worker email' do
    rendered.should have_selector('table > tr > td', :content => @worker1.email)
  end

  it 'should have first worker description' do
    rendered.should have_selector('table > tr > td', :content => @worker1.description)
  end

  it 'should have second worker nickname' do
    rendered.should have_selector('table > tr > td', :content => @worker2.nickname)
  end

  it 'should have second worker name' do
    rendered.should have_selector('table > tr > td', :content => @worker2.name)
  end

  it 'should have second worker surname' do
    rendered.should have_selector('table > tr > td', :content => @worker2.surname)
  end

  it 'should have second worker email' do
    rendered.should have_selector('table > tr > td', :content => @worker2.email)
  end

  it 'should have second worker description' do
    rendered.should have_selector('table > tr > td', :content => @worker2.description)
  end

  private

    def mock_worker
      @mock_worker_num ||= 0
      @mock_worker_num += 1
      mock_model(Worker,
        :nickname => "nickname#{@mock_worker_num}",
        :name => "name#{@mock_worker_num}",
        :surname => "surname#{@mock_worker_num}",
        :email => "email#{@mock_worker_num}",
        :description => "description#{@mock_worker_num}"
      )
    end

end
