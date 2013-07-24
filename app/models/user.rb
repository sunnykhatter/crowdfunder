class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :password
  validates :first_name, :last_name, :email, :password, presence:true
  has_many :projects

  


  private

  
end
