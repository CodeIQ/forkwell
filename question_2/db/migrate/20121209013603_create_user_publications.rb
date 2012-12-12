class CreateUserPublications < ActiveRecord::Migration
  def change
    create_table :user_publications do |t|
      t.integer :user_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
