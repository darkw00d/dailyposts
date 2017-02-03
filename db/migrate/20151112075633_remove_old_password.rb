class RemoveOldPassword < ActiveRecord::Migration
   def up
  
  remove_column "users", "password", :string
  end

def down
	add_column "users", "password", :string 
  end
end
