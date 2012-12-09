class UserSkilltag < ActiveRecord::Base
  attr_accessible :skilltag_id, :user_id

  belongs_to :user
  belongs_to :skilltag
end
