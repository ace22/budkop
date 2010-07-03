class Service < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title
end
