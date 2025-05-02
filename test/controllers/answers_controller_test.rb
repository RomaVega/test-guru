require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one) # Фикстура для вопроса
    @answer = answers(:one)     # Фикстура для ответа
  end

  test "should get new" do
    get new_question_answer_path(@question)
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post question_answers_path(@question), params: { answer: { body: "New Answer", correct: false } }
    end
    assert_redirected_to answer_path(Answer.last)
  end

  test "should get edit" do
    get edit_answer_path(@answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_path(@answer), params: { answer: { body: "Updated Answer" } }
    assert_redirected_to answer_path(@answer)
  end

  test "should show answer" do
    get answer_path(@answer)
    assert_response :success
  end

  test "should destroy answer" do
    assert_difference("Answer.count", -1) do
      delete answer_path(@answer)
    end
    assert_redirected_to tests_path # Или другой путь, куда перенаправляет ваш destroy
  end
end
