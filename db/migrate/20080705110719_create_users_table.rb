class CreateUsersTable < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
       t.string   "login",            :limit => 40
       t.string   "email",            :limit => 100
       t.string   "crypted_password", :limit => 40
       t.string   "salt",             :limit => 40
       t.string   "activation_code",  :limit => 40
       t.datetime "activated_at"
       t.datetime "created_at"
       t.datetime "updated_at"
       t.datetime "deleted_at"
       t.string   "remember_token"
       t.datetime "remember_token_expires_at"
       t.string   "filter"
       t.boolean  "admin",            :default => false
     end
  end

  def self.down
    drop_table :users
  end
end
