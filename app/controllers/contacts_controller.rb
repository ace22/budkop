class ContactsController < ApplicationController

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])
    @contact.ip_address = request.remote_ip
    @contact.browser = request.env['HTTP_USER_AGENT']
    @contact = Contact.new if @message_sent = @contact.save
    render :action => '/contact_us/show'
  end

  def index
    redirect_to contact_us_path
  end

end
