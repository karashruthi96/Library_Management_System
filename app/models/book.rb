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
    respond_to do |format|
    if @reservation.update(reservation_params)
      format.html { redirect_to @book, notice: 'Reservation was successfully created.' }
      format.json { render :show, status: :created, location: @book }
    else
      format.html { render :new }
      format.json { render json: @book.errors, status: :unprocessable_entity }
    end
    end
    end
end
