class UserPublication < ActiveRecord::Base
  attr_accessible :publication_id, :user_id

  belongs_to :user
  belongs_to :publication
end
