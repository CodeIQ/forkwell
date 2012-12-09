class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :url
      t.integer :category

      t.timestamps
    end
  end
end
