class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :payments
end
