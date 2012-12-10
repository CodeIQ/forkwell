class CompanyUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  attr_accessible :is_admin, :position
end
