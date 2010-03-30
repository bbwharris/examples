class Init < ActiveRecord::Migration
  def self.up
    create_table "posts" do |t|
      t.string   "title", :null => false
      t.text     "body", :null => false
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    raise IrreversibleMigration
  end
end
