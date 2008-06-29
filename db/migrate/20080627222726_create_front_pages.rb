class CreateFrontPages < ActiveRecord::Migration
  def self.up
    create_table :front_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :front_pages
  end
end
