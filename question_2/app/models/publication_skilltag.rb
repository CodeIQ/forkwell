class PublicationSkilltag < ActiveRecord::Base
  attr_accessible :publication_id, :skilltag_id

  belongs_to :publication
  belongs_to :skilltag
end
