require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "TestUser123", email: "test@example.com")
    @category = Category.create!(title: "Test Category")
    @test = Test.create!(title: "Test", level: 1, category: @category, author: @user)
    @question = Question.create!(body: "Test question", test: @test)
    @answer = Answer.create!(body: "Test answer", question: @question, correct: false)
  end

  test "should get new" do
    get new_question_answer_url(@question)
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post question_answers_url(@question), params: { answer: { body: "New Answer", correct: true } }
    end
    assert_redirected_to edit_question_url(@question)
  end

  test "should get edit" do
    get edit_answer_url(@answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer), params: { answer: { body: "Updated Answer" } }
    assert_redirected_to edit_question_url(@answer.question)
  end

  test "should destroy answer" do
    assert_difference("Answer.count", -1) do
      delete answer_url(@answer)
    end
    assert_redirected_to test_url(@test) # Ожидаем редирект на /tests/:id
  end
end
