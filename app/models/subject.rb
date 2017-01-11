class Subject < ApplicationRecord
has_many :head_lines

scope :sorted, lambda { order("created_at ASC") }
end
