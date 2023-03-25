class Event < ApplicationRecord
    has_many :tickets
  has_many :payments
  has_many :users, through: :payments
end
