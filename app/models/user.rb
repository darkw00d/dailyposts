class User < ApplicationRecord
has_secure_password
has_many :contents
has_many :head_lines

end
