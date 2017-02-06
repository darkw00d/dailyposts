class Content < ApplicationRecord
belongs_to :head_line, optional: true
belongs_to :theme, optional: true
scope :sorted, lambda { order("place DESC") }
scope :score, lambda { order("score ASC") }
belongs_to :user, optional: true


  mount_uploader :image, ImageUploader

end
