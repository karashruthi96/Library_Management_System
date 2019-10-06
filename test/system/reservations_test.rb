require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "books", with: @reservation.Books_id
    fill_in "User", with: @reservation.User_id
    check "Bookmark" if @reservation.bookmark
    fill_in "D return", with: @reservation.d_return
    fill_in "Fine total", with: @reservation.fine_total
    fill_in "Status", with: @reservation.status
    fill_in "T borrow", with: @reservation.t_borrow
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "books", with: @reservation.Books_id
    fill_in "User", with: @reservation.User_id
    check "Bookmark" if @reservation.bookmark
    fill_in "D return", with: @reservation.d_return
    fill_in "Fine total", with: @reservation.fine_total
    fill_in "Status", with: @reservation.status
    fill_in "T borrow", with: @reservation.t_borrow
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
