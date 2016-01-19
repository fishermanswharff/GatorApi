class CreateAuthenticationProviders < ActiveRecord::Migration
  def change
    create_table :authentication_providers, force: true do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :authentication_providers, [:name], name: :index_name_on_authentication_providers
  end
end
