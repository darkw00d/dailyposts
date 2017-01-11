class HeadLine < ApplicationRecord
belongs_to :subjects
scope :sorted, lambda { order("created_at ASC") }

end
