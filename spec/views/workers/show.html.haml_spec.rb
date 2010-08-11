require 'spec_helper'

describe "workers/show.html.erb" do

  before do
    @worker = mock_model(Worker,
      :nickname => "MyString",
      :name => "MyString",
      :surname => "MyString",
      :email => "MyString",
      :description => "MyString"
    )
    assigns[:worker]
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("MyString")
  end

end
