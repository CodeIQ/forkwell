class Publication < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :concerns
  has_many :publication_comments
end
