class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,:checkout, :return]

  # GET /books
  # GET /books.json
  def index
    @book = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'books was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  def checkout
    reservation_obj=Reservation.find_by_Books_id(@book.id)
     respond_to do |format|
    if @book.available== false
      format.html { redirect_to @book, notice: 'books is not available/book already borrowed' }
    else
        reservation_params={:User_id=> current_user.id, :Books_id=> @book.id, :t_borrow=>Time.now , :d_return=>Time.now+ 10.days, :status=>'borrowed', :bookmark=>false, :fine_total=>0, :created_at=>Time.now,:updated_at=>Time.now}
        @book.update(b_title: @book.b_title, b_author: @book.b_author , b_lang: @book.b_lang , b_pub: @book.b_pub , b_edition: @book.b_edition, b_image: @book.b_image , b_subject: @book.b_subject , b_summary: @book.b_summary , b_spl: @book.b_spl, available: false , Library_id: @book.Library_id , created_at: @book.created_at, updated_at: @book.updated_at)
        if @book.create_reserve(reservation_params)
          format.html { redirect_to @book, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { redirect_to @book, notice: 'Reservation was not  created.' }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
     end
      end
  end

  def return
    #reservation= Reservation.where(:User_id=> current_user.id,:Books_id=> @book.id,:status=> 'borrowed')
    respond_to do |format|
      @book=Book.find_by_id(params[:id])

      @reservation= Reservation.where(:User_id=> current_user.id,:Books_id => @book.id,:status=> 'borrowed').first
    reservation_param={:User_id=> current_user.id, :Books_id=> @book.id, :t_borrow=>@reservation.t_borrow , :d_return=>@reservation.d_return, :status=>'returned', :bookmark=>@reservation.bookmark, :fine_total=>@reservation.fine_total, :created_at=>@reservation.created_at,:updated_at=>@reservation.updated_at }

      if @reservation.update!(reservation_param)
      format.html { redirect_to @book, alert: 'books was successfully returned.' }
      format.json { render :show, status: :ok, location: @book }

      else
      format.html { render :edit }
      format.json { render json: @book.errors, status: :unprocessable_entity }
      end

    @book.update(b_title: @book.b_title, b_author: @book.b_author , b_lang: @book.b_lang , b_pub: @book.b_pub , b_edition: @book.b_edition, b_image: @book.b_image , b_subject: @book.b_subject , b_summary: @book.b_summary , b_spl: @book.b_spl, available: true , Library_id: @book.Library_id , created_at: @book.created_at, updated_at: @book.updated_at)
    end
  end

  def hold

    @book=Book.find_by_id(params[:id])
    count= Reservation.where(:Books_id => @book.id,:status=> 'hold').count
    respond_to do |format|

    if count < 3
      reservation_params={:User_id=> current_user.id, :Books_id=> @book.id, :t_borrow=>Time.now , :d_return=>Time.now+ 10.days, :status=>'hold', :bookmark=>false, :fine_total=>0, :created_at=>Time.now,:updated_at=>Time.now}

      if @book.create_reserve(reservation_params)
        format.html { redirect_to @book, alert: 'hold was successfully returned.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to @book, notice: 'Hold was not  created.' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end

    else
      format.html { redirect_to @book, notice: 'HOLD limit reached.' }
      format.json { render json: @book.errors, status: :unprocessable_entity }
    end

  end
 end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'books was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  def addremove
    @book = Book.all
  end
  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'books was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:b_title, :b_author, :b_lang, :b_pub, :b_edition, :b_image, :b_subject, :b_summary, :b_spl, :Library_id, :available)
    end
end
