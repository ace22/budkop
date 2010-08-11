class Contact < ActiveRecord::Base

  attr_protected :ip_address, :browser, :email_sent

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message

  before_save :slice_ip_address_and_browser

  private

    def slice_ip_address_and_browser
      self.ip_address = ip_address.slice(0, 254)
      self.browser = browser.slice(0, 254)
    end

end
