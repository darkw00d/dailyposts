class HeadLine < ApplicationRecord
has_and_belongs_to_many :subjects
has_many :contents
belongs_to :theme, optional: true
scope :sorted, lambda { order("created_at ASC") }
scope :score, lambda { order("score ASC") }
  mount_uploader :image, ImageUploader
end
