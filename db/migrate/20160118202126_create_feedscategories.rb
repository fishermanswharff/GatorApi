class CreateFeedscategories < ActiveRecord::Migration
  def change
    create_table :feedscategories do |t|
      t.belongs_to :feed, null: false
      t.belongs_to :catgory, null: false
      t.timestamps null: false
    end
  end
end
