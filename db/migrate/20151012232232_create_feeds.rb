class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title, index: true
      t.string :url, index: true, null: false
      t.text :description
      t.string :image_url
      t.string :feed_type
      t.string :feed_version
      t.string :encoding
      t.timestamps
    end
  end
end
