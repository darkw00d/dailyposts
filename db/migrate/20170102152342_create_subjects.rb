class CreateSubjects < ActiveRecord::Migration[5.0]
 def up
    create_table :subjects do |t|
      t.timestamps null: false

t.string "name", :limit => 25
t.integer "mentions"

    end

end
     def down
    drop_table :subjects do |t|

    end
  end

end
