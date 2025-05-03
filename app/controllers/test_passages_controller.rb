class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show
    if @test_passage.completed?
      redirect_to result_test_test_passage_path(@test_passage.test, @test_passage)
    end
  end

  def update
    answer_id = params.dig(:test_passage, :answer_id)
    puts "Answer ID: #{answer_id.inspect}"
    if answer_id.present?
      @test_passage.accept!(answer_id)
    else
      puts "No answer ID provided."
    end

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
end
