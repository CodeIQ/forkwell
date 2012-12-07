class PublicationComment < ActiveRecord::Base
  belongs_to :publication
  attr_accessible :body
end
