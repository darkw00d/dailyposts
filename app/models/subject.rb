class Subject < ApplicationRecord
has_and_belongs_to_many :head_lines
scope :sorted, lambda { order("created_at ASC") }
end
