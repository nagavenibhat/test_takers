require "application_system_test_case"

class TestTakersTest < ApplicationSystemTestCase
  setup do
    @test_taker = test_takers(:one)
  end

  test "visiting the index" do
    visit test_takers_url
    assert_selector "h1", text: "Test Takers"
  end

  test "creating a Test taker" do
    visit test_takers_url
    click_on "New Test Taker"

    fill_in "Address", with: @test_taker.address
    fill_in "Email", with: @test_taker.email
    fill_in "Firstname", with: @test_taker.firstname
    fill_in "Gender", with: @test_taker.gender
    fill_in "Lastname", with: @test_taker.lastname
    fill_in "Login", with: @test_taker.login
    fill_in "Password", with: @test_taker.password
    fill_in "Picture", with: @test_taker.picture
    fill_in "Title", with: @test_taker.title
    click_on "Create Test taker"

    assert_text "Test taker was successfully created"
    click_on "Back"
  end

  test "updating a Test taker" do
    visit test_takers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @test_taker.address
    fill_in "Email", with: @test_taker.email
    fill_in "Firstname", with: @test_taker.firstname
    fill_in "Gender", with: @test_taker.gender
    fill_in "Lastname", with: @test_taker.lastname
    fill_in "Login", with: @test_taker.login
    fill_in "Password", with: @test_taker.password
    fill_in "Picture", with: @test_taker.picture
    fill_in "Title", with: @test_taker.title
    click_on "Update Test taker"

    assert_text "Test taker was successfully updated"
    click_on "Back"
  end

  test "destroying a Test taker" do
    visit test_takers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test taker was successfully destroyed"
  end
end
