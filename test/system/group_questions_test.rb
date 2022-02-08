require "application_system_test_case"

class GroupQuestionsTest < ApplicationSystemTestCase
  setup do
    @group_question = group_questions(:one)
  end

  test "visiting the index" do
    visit group_questions_url
    assert_selector "h1", text: "Group Questions"
  end

  test "creating a Group question" do
    visit group_questions_url
    click_on "New Group Question"

    fill_in "Name", with: @group_question.name
    click_on "Create Group question"

    assert_text "Group question was successfully created"
    click_on "Back"
  end

  test "updating a Group question" do
    visit group_questions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @group_question.name
    click_on "Update Group question"

    assert_text "Group question was successfully updated"
    click_on "Back"
  end

  test "destroying a Group question" do
    visit group_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group question was successfully destroyed"
  end
end
