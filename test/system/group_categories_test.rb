require "application_system_test_case"

class GroupCategoriesTest < ApplicationSystemTestCase
  setup do
    @group_category = group_categories(:one)
  end

  test "visiting the index" do
    visit group_categories_url
    assert_selector "h1", text: "Group Categories"
  end

  test "creating a Group category" do
    visit group_categories_url
    click_on "New Group Category"

    fill_in "Name", with: @group_category.name
    click_on "Create Group category"

    assert_text "Group category was successfully created"
    click_on "Back"
  end

  test "updating a Group category" do
    visit group_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @group_category.name
    click_on "Update Group category"

    assert_text "Group category was successfully updated"
    click_on "Back"
  end

  test "destroying a Group category" do
    visit group_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group category was successfully destroyed"
  end
end
