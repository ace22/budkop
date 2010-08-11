class ContactUsController < ApplicationController

  def show
    @contact = Contact.new
  end

end
