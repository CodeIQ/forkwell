class CreatePublicationComments < ActiveRecord::Migration
  def change
    create_table :publication_comments do |t|
      t.text       :body
      t.references :publication

      t.timestamps
    end
    add_index :publication_comments, :publication_id
  end
end
