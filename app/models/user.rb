class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :email, presence: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :contact, presence: true

    has_many :events, through: :payments
end
