class CreatePublicationSkilltags < ActiveRecord::Migration
  def change
    create_table :publication_skilltags do |t|
      t.integer :publication_id
      t.integer :skilltag_id

      t.timestamps
    end
  end
end
