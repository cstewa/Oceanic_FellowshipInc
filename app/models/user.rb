class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :is_admin, :is_registered

  has_many :seats
  has_many :flights, :through => :seats
end
