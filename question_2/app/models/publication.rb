class Publication < ActiveRecord::Base
  attr_accessible :category, :title, :url

  has_many :user_publications
  has_many :users, through: :user_publications

  has_many :publication_skilltags
  has_many :skilltags, through: :publication_skilltags
end
