class Subject < ApplicationRecord
has_and_belongs_to_many :head_lines
belongs_to :themes, optional: true
scope :sorted, lambda { order("created_at ASC") }
scope :score, lambda { order("score ASC") }

  mount_uploader :image, ImageUploader
end
