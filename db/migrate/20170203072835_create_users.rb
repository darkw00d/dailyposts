class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
t.string "first_name", :limit => 15
t.string "last_name", :limit => 15
t.string "email", :limit => 25
t.string "username", :limit => 15
t.string "password", :limit => 15
#image


      t.timestamps null: false
    end
end
     def down
    drop_table :users do |t|


    end
  end

end
