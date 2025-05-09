class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  before_action :set_test, only: %i[show update result]

  def create
    @test_passage = TestPassage.create!(user: User.first, test: Test.find(params[:test_id]))
    redirect_to test_test_passage_path(@test_passage.test, @test_passage)
  end

  def show
    redirect_to result_test_test_passage_path(@test_passage.test, @test_passage) if @test_passage.completed?
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_test_passage_path(@test_passage.test, @test_passage)
    else
      redirect_to test_test_passage_path(@test_passage.test, @test_passage)
    end
  end

  def result
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_test
    @test = @test_passage.test
  end
end
