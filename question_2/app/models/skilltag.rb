class Skilltag < ActiveRecord::Base
  attr_accessible :name

  has_many :publication_skilltags
  has_many :publications, through: :publication_skilltags

  has_many :user_skilltags
  has_many :users, through: :user_skilltags
end
