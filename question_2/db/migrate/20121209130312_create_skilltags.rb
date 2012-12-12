class CreateSkilltags < ActiveRecord::Migration
  def change
    create_table :skilltags do |t|
      t.string :name

      t.timestamps
    end
  end
end
