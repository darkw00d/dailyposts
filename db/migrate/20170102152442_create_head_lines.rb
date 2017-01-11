class CreateHeadLines < ActiveRecord::Migration[5.0]
 def up
    create_table :head_lines do |t|
      t.timestamps null: false

t.string "text", :limit => 200
t.integer "score"
t.integer "subject_id"
    end
add_index :head_lines, ["subject_id"]
end
     def down
    drop_table :head_lines do |t|

    end
  end
end
