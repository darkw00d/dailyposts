class CreateEditors < ActiveRecord::Migration[5.0]
 
def up
    create_table :editors do |t|
      t.timestamps null: false

t.string "email", :limit => 25
t.string "username", :limit => 15
t.string "password", :limit => 15
t.string "location"
t.integer "points"
    end

end
     def down
    drop_table :editors do |t|

    end
  end


end
