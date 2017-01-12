class HeadLine < ApplicationRecord
has_and_belongs_to_many :subjects
has_many :contents
scope :sorted, lambda { order("created_at ASC") }

end
