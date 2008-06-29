class CreateFeedPosts < ActiveRecord::Migration
  def self.up
    create_table :feed_posts do |t|
      t.string :title
      t.string :authors
      t.string :categories
      t.date :date_published
      t.text :body
      t.integer :feed_id
      t.string :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :feed_posts
  end
end
