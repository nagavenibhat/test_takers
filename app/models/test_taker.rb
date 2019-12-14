class TestTaker < ApplicationRecord

  validates_presence_of :login, :password, :title, :firstname, :lastname, :address, :email, :gender, :picture
  validates_uniqueness_of :login

end
