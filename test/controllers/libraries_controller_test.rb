require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test "should get index" do
    get libraries_url
    assert_response :success
  end

  test "should get new" do
    get new_library_url
    assert_response :success
  end

  test "should create library" do
    assert_difference('Library.count') do
      post libraries_url, params: { library: { l_fine: @library.l_fine, l_location: @library.l_location, l_max_days: @library.l_max_days, l_name: @library.l_name, l_university: @library.l_university } }
    end

    assert_redirected_to library_url(Library.last)
  end

  test "should show library" do
    get library_url(@library)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_url(@library)
    assert_response :success
  end

  test "should update library" do
    patch library_url(@library), params: { library: { l_fine: @library.l_fine, l_location: @library.l_location, l_max_days: @library.l_max_days, l_name: @library.l_name, l_university: @library.l_university } }
    assert_redirected_to library_url(@library)
  end

  test "should destroy library" do
    assert_difference('Library.count', -1) do
      delete library_url(@library)
    end

    assert_redirected_to libraries_url
  end
end
