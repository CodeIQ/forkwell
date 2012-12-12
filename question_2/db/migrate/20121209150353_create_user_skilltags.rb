class CreateUserSkilltags < ActiveRecord::Migration
  def change
    create_table :user_skilltags do |t|
      t.integer :user_id
      t.integer :skilltag_id

      t.timestamps
    end
  end
end
