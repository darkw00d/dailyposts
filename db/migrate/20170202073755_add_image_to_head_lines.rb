class AddImageToHeadLines < ActiveRecord::Migration[5.0]
  def change
    add_column :head_lines, :image, :string
  end
end
