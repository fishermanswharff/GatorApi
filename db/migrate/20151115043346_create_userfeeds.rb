class CreateUserfeeds < ActiveRecord::Migration
  def change
    create_table :userfeeds do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :feed, index: true, null: false
      t.timestamps null: false
    end
    add_foreign_key :userfeeds, :users, on_delete: :cascade
    add_foreign_key :userfeeds, :feeds, on_delete: :cascade
  end
end
