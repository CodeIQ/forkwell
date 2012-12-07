class Concern < ActiveRecord::Base
  belongs_to :publication
  # attr_accessible :title, :body
end
