class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :user
      t.references :company
      t.string :position
      t.boolean :is_admin

      t.timestamps
    end
    add_index :company_users, :user_id
    add_index :company_users, :company_id
  end
end
