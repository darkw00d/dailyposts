class HeadLine < ApplicationRecord
has_and_belongs_to_many :subjects
scope :sorted, lambda { order("created_at ASC") }

end
