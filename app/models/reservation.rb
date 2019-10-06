class Reservation < ApplicationRecord
  belongs_to :User
  belongs_to :Book, optional: true
end
