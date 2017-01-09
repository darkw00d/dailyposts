class CreateThemes < ActiveRecord::Migration[5.0]
 def up
    create_table :themes do |t|
      t.timestamps null: false

t.string "name", :limit => 25
t.integer "mentions"

    end

end
     def down
    drop_table :themes do |t|

    end
  end
end
