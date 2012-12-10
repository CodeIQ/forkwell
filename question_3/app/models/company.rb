class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :company_users
  has_many :users, through: :company_users
end
