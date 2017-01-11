class CreateHeadLinesSubjectsJoin < ActiveRecord::Migration[5.0]
  def change
      create_table :head_lines_subjects , :id => false do |t|

t.integer "head_line_id"
t.integer "subject_id"

    end

add_index :head_lines_subjects, ["head_line_id", "subject_id"]

  end

end
