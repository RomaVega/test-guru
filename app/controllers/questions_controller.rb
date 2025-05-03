class QuestionsController < ApplicationController
  # Только для new/create: есть params[:test_id]
  before_action :find_test, only: %i[new create]

  # Для всех остальных (edit, update, show, destroy) — ищем вопрос напрямую
  before_action :set_question, only: %i[show edit update destroy]

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_path(@question.test), notice: "Question created"
    else
      render :new
    end
  end

  def edit
    @test = @question.test
    @question = Question.find(params[:id])
    @new_answer = Answer.new(question: @question)
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Question updated"
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test), notice: "Question deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :correct_answer_id)
  end
end
