require "test_helper"

class TestPassagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = tests(:one)              # Фикстура для теста
    @test_passage = test_passages(:one) # Фикстура для test_passage
  end

  test "should get show" do
    get test_test_passage_path(@test, @test_passage)
    assert_response :success
  end

  test "should update test_passage" do
    answer = answers(:one) # Фикстура для ответа
    patch test_test_passage_path(@test, @test_passage), params: { test_passage: { answer_id: answer.id } }
    assert_redirected_to test_test_passage_path(@test, @test_passage)
  end

  test "should get result" do
    # Устанавливаем completed в true, чтобы показать результат
    @test_passage.update(completed: true)
    get result_test_test_passage_path(@test, @test_passage)
    assert_response :success
  end
end
