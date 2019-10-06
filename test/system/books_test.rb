require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "books"
  end

  test "creating a books" do
    visit books_url
    click_on "New books"

    fill_in "Library", with: @book.Library_id
    fill_in "B author", with: @book.b_author
    fill_in "B edition", with: @book.b_edition
    fill_in "B image", with: @book.b_image
    fill_in "B lang", with: @book.b_lang
    fill_in "B pub", with: @book.b_pub
    check "B spl" if @book.b_spl
    fill_in "B subject", with: @book.b_subject
    fill_in "B summary", with: @book.b_summary
    fill_in "B title", with: @book.b_title
    click_on "Create books"

    assert_text "books was successfully created"
    click_on "Back"
  end

  test "updating a books" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Library", with: @book.Library_id
    fill_in "B author", with: @book.b_author
    fill_in "B edition", with: @book.b_edition
    fill_in "B image", with: @book.b_image
    fill_in "B lang", with: @book.b_lang
    fill_in "B pub", with: @book.b_pub
    check "B spl" if @book.b_spl
    fill_in "B subject", with: @book.b_subject
    fill_in "B summary", with: @book.b_summary
    fill_in "B title", with: @book.b_title
    click_on "Update books"

    assert_text "books was successfully updated"
    click_on "Back"
  end

  test "destroying a books" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "books was successfully destroyed"
  end
end
