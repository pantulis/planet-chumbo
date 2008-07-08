require 'digest/sha1'

class User < ActiveRecord::Base
  authenticated_model
      
  # # Virtual attribute for the unencrypted password
  # attr_accessor :password
  # 
  # validates_presence_of     :login, :email
  # validates_presence_of     :password                  
  # validates_presence_of     :password_confirmation
  # validates_length_of       :password, :within => 4..40
  # validates_confirmation_of :password
  # validates_length_of       :login,    :within => 3..40
  # validates_length_of       :email,    :within => 3..100
  # validates_uniqueness_of   :login, :email, :case_sensitive => false
  # 
  # before_save :encrypt_password
  
end
