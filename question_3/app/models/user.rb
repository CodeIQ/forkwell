class User < ActiveRecord::Base
  attr_accessible :username

  has_many :company_users
  has_many :companies, through: :company_users
end
