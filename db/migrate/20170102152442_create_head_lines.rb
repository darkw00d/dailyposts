class CreateHeadLines < ActiveRecord::Migration[5.0]
 def up
    create_table :head_lines do |t|
      t.timestamps null: false

t.string "text", :limit => 200
t.integer "score",:default =>0
t.integer "theme_id"

    end
    add_index :head_lines, ["theme_id"]

end
     def down
    drop_table :head_lines do |t|

    end
  end
end
