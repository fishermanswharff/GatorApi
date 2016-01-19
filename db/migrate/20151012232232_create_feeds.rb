class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url, index: true, null: false
      t.timestamps null: false
    end
  end
end
