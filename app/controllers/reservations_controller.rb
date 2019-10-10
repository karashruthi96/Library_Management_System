class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :json

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def unhold
      @book=Book.find_by_id(params[:format])
      @reservation=Reservation.find_by_id(params[:id])
      @reservation.destroy
              redirect_to @book, alert: 'hold was successfully cancelled.'
  end

  def unbookmark
    @book=Book.find_by_id(params[:id])
    @reservation=Reservation.find_by_id( params[:type])
    @reservation.destroy
      redirect_to @book, alert: 'bookmark was successfully cancelled.'
  end

  def bookmark
    @book=Book.find_by_id(params[:id])
    reservation_params={:User_id=> current_user.id, :Books_id=> @book.id, :t_borrow=>nil , :d_return=>nil, :status=>'bookmarked', :bookmark=>true, :fine_total=>0, :created_at=>Time.now,:updated_at=>Time.now}
    @reservation= Reservation.new(reservation_params)
    if @reservation.save
    end
  end

  def bookmark_show
    render '/bookmark'
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:User_id, :Books_id, :t_borrow, :d_return, :status, :bookmark, :fine_total)
    end
end
