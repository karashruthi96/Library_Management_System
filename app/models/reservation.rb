class Reservation < ApplicationRecord
  belongs_to :User
  belongs_to :Books
end
