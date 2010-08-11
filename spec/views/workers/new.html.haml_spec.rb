require 'spec_helper'

describe "workers/new.html.erb" do

  before do
    @worker = mock_model(Worker,
      :new_record? => true,
      :nickname => "MyString",
      :name => "MyString",
      :surname => "MyString",
      :email => "MyString",
      :description => "MyString"
    )
    assigns[:worker] = @worker
  end

  it "renders new worker form" do
    render
    rendered.should have_selector("form", :action => workers_path, :method => "post") do |form|
      form.should have_selector("input#worker_ nickname", :name => "worker[ nickname]")
      form.should have_selector("input#worker_name", :name => "worker[name]")
      form.should have_selector("input#worker_surname", :name => "worker[surname]")
      form.should have_selector("input#worker_email", :name => "worker[email]")
      form.should have_selector("input#worker_description", :name => "worker[description]")
    end
  end

end
