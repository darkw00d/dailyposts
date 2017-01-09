class CreateContents < ActiveRecord::Migration[5.0]
 def up
    create_table :contents do |t|
      t.timestamps null: false

t.string "text", :limit => 200
t.integer "score"

    end

end
     def down
    drop_table :contents do |t|

    end
  end
end
