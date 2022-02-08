require "test_helper"

class GroupQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_question = group_questions(:one)
  end

  test "should get index" do
    get group_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_group_question_url
    assert_response :success
  end

  test "should create group_question" do
    assert_difference('GroupQuestion.count') do
      post group_questions_url, params: { group_question: { name: @group_question.name } }
    end

    assert_redirected_to group_question_url(GroupQuestion.last)
  end

  test "should show group_question" do
    get group_question_url(@group_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_question_url(@group_question)
    assert_response :success
  end

  test "should update group_question" do
    patch group_question_url(@group_question), params: { group_question: { name: @group_question.name } }
    assert_redirected_to group_question_url(@group_question)
  end

  test "should destroy group_question" do
    assert_difference('GroupQuestion.count', -1) do
      delete group_question_url(@group_question)
    end

    assert_redirected_to group_questions_url
  end
end
