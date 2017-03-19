class CreateSubjects < ActiveRecord::Migration[5.0]
 def up
    create_table :subjects do |t|
      t.timestamps null: false

t.string "text", :limit => 25
t.integer "score" ,:default =>0
t.integer "theme_id"
    end
add_index :subjects, ["theme_id"]

end
     def down
    drop_table :subjects do |t|

    end
  end

end
