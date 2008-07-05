class CreatePlanetsTable < ActiveRecord::Migration
  def self.up
    create_table "planets", :force => true do |t|
       t.string   "host"
       t.string   "title"
       t.string   "subtitle"
       t.string   "email"
       t.string   "timezone"
       t.string   "current_theme_path"
       t.datetime "created_at"
       t.datetime "updated_at"
     end
  end

  def self.down
    drop_table :planets
  end
end
