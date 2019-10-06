class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,:checkout]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    if params[:search_title]
      @books=Book.search_title(params[:search_title])
    elsif params[:search_author]
      @books=Book.search_author(params[:search_author])
    elsif params[:search_sub]
      @books=Book.search_sub(params[:search_sub])
    elsif params[:search_pub]
      @books=Book.search_pub(params[:search_pub])
    else
      @books= Book.all
    end
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
      format.html { redirect_to @book, notice: 'books is not available.' }
    else
      if(Reservation.find_by_Books_id(@book.id).nil?)
        reservation_params={:User_id=> current_user.id, :Books_id=> @book.id, :t_borrow=>Time.now , :d_return=>Time.now+ 10.days, :status=>'borrowed', :bookmark=>false, :fine_total=>0, :created_at=>Time.now,:updated_at=>Time.now}

        if @book.create_reserve(reservation_params)

          format.html { redirect_to @book, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { redirect_to @book, notice: 'Reservation was not  created.' }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @book, notice: 'book already borrowed.' }
        format.json { render :show, status: :created, location: @book }
      end
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
      params.require(:book).permit(:b_title, :b_author, :b_lang, :b_pub, :b_edition, :b_image, :b_subject, :b_summary, :b_spl, :Library_id)
    end
end
