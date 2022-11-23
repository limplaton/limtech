class Client < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :username, :email
  validates_presence_of :firt_name, :last_name, :username, :email, :client_id, :company_name

  
end
