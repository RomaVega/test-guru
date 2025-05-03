require "test_helper"

class TestPassagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @test = create(:test, author: @user)
    @test_passage = create(:test_passage, user: @user, test: @test)
  end

  test "should get show" do
    get test_test_passage_url(@test_passage.test, @test_passage)
    assert_response :success
  end

  test "should get result" do
    @test_passage.update!(current_question: nil, completed: true)
    get result_test_test_passage_url(@test_passage.test, @test_passage)
    assert_response :success
  end

  test "should update test_passage" do
    answer = create(:answer, question: @test_passage.current_question)
    patch test_test_passage_url(@test_passage.test, @test_passage), params: { test_passage: { answer_id: answer.id } }
    assert_redirected_to test_test_passage_url(@test_passage.test, @test_passage)
  end
end
