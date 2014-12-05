class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, null: false
      t.integer :role, null: false, default: 1 # defaults to generic user account
      t.string :email, unique: true, null: false
      t.string :password_digest
      t.string :token
      
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.timestamps null:false
    end
    
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
