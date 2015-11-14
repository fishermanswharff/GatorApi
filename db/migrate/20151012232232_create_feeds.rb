class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title, index: true, null: false
      t.string :url, index: true, null: false
      t.text :description, null: false
      t.belongs_to :user, index: true, required: true
      t.timestamps
    end
  end
end
