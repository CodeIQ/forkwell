class Skilltag < ActiveRecord::Base
  attr_accessible :name

  has_many :publication_skilltags
  has_many :publications, through: :publication_skilltags
end
