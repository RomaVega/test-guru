class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = @test.questions
    render plain: @questions.map { |q| q.body }.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
        render plain: " Вопрос успешно создан"
    else
        render :new
    end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос удалён"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end

  def record_not_found
    render plain: "Record not found", status: :not_found
  end
end
