class Book < ApplicationRecord
  belongs_to :Library
  require 'Reservation'

  def create_reserve(reservation_params)

    @reservation=Reservation.new(reservation_params)
    if @reservation.save!
      return true
    else
      return false
    end
  end


  def update_reserve(reservation_params)
    @reservation=Reservation.update(reservation_params)
    if @reservation.update(reservation_params)
      true
    else
      false
    end
    end
end
