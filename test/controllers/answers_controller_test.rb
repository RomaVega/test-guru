require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @test = create(:test, author: @user)
    @question = create(:question, test: @test)
    @answer = create(:answer, question: @question)
  end

  test "should get show" do
    get answer_url(@answer, format: :html)
    assert_response :success
  end

  test "should get new" do
    get new_question_answer_url(@question, format: :html)
    assert_response :success
  end

  test "should create answer" do
    puts "Question answers count: #{@question.answers.count}"
    assert_difference("Answer.count") do
      post question_answers_url(@question, format: :html), params: { answer: { body: "New Answer", correct: false } }
    end
    assert_redirected_to edit_question_url(@question)
  end

  test "should get edit" do
    get edit_answer_url(@answer, format: :html)
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer, format: :html), params: { answer: { body: "Updated Answer" } }
    assert_redirected_to answer_url(@answer)
  end

  test "should destroy answer" do
    puts "Answer: #{@answer.inspect}"
    assert_difference("Answer.count", -1) do
      delete answer_url(@answer, format: :html)
    end
    assert_redirected_to edit_question_url(@answer.question)
  end
end
