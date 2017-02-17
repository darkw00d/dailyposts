class HeadLine < ApplicationRecord
has_and_belongs_to_many :subjects
has_many :contents
belongs_to :theme, optional: true
belongs_to :user, optional: true
scope :sorted, lambda { order("created_at ASC") }
scope :scored, lambda { order("score ASC") }
  mount_uploader :image, ImageUploader
end
