class Subject < ApplicationRecord
has_and_belongs_to_many :head_lines
scope :sorted, lambda { order("created_at ASC") }
scope :score, lambda { order("score ASC") }
end
