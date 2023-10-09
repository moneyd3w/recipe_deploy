class UserInfo < ApplicationRecord
    has_secure_password
    validates :username, presence: true
end
