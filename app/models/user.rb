class User < ActiveRecord::Base
  include Hubstaff
  serialize :client
  has_secure_password
  validates :email, :presence => true

end
