class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.references :publication

      t.timestamps
    end
    add_index :concerns, :publication_id
  end
end
