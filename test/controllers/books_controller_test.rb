require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('books.count') do
      post books_url, params: { book: { Library_id: @book.Library_id, b_author: @book.b_author, b_edition: @book.b_edition, b_image: @book.b_image, b_lang: @book.b_lang, b_pub: @book.b_pub, b_spl: @book.b_spl, b_subject: @book.b_subject, b_summary: @book.b_summary, b_title: @book.b_title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { Library_id: @book.Library_id, b_author: @book.b_author, b_edition: @book.b_edition, b_image: @book.b_image, b_lang: @book.b_lang, b_pub: @book.b_pub, b_spl: @book.b_spl, b_subject: @book.b_subject, b_summary: @book.b_summary, b_title: @book.b_title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('books.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
