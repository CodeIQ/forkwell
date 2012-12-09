class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :username

  has_many :user_publications
  has_many :publications, through: :user_publications
end
