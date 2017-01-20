class CreateContents < ActiveRecord::Migration[5.0]
 def up
    create_table :contents do |t|
      t.timestamps null: false

t.string "text", :limit => 200
t.integer "score", :default =>0
t.integer "place"
t.integer "head_line_id"
t.integer "theme_id"
    end

add_index :contents, ["head_line_id"]
add_index :contents, ["theme_id"]
end
     def down
    drop_table :contents do |t|

    end
  end
end


