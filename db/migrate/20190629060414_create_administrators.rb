class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.integer :status_id, default: 1

      t.timestamps
    end

    add_index :administrators, :user_name, unique: true
  end
end
