require "test_helper"

class TestPassagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "TestUser123", email: "test@example.com") # Более длинное имя
    @category = Category.create!(title: "Test Category")
    @test = Test.create!(title: "Sample Test", level: 1, category: @category, author: @user)
    @question = Question.create!(body: "Sample Question", test: @test)
    @answer = Answer.create!(body: "Sample Answer", question: @question, correct: true)
    @test_passage = TestPassage.create!(user: @user, test: @test)
  end

  test "should show test passage" do
    get test_test_passage_url(@test, @test_passage)
    assert_response :success
  end

  test "should update with correct answer" do
    put test_test_passage_url(@test, @test_passage), params: { answer_ids: [ @answer.id ] }
    assert_equal 1, @test_passage.reload.correct_questions
  end

  test "should show result" do
    @test_passage.update!(completed: true)
    get result_test_test_passage_url(@test, @test_passage)
    assert_response :success
  end
end
