class Theme < ApplicationRecord
scope :sorted, lambda { order("created_at ASC") }
scope :score, lambda { order("score ASC") }
has_many :contents
has_many :head_lines
end
