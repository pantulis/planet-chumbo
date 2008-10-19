class FeedAddFailing < ActiveRecord::Migration
  def self.up
    add_column :feeds, :failing, :boolean
  end

  def self.down
    remove_column :feeds, :failing
  end
end
