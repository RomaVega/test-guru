class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test, only: %i[new create]
  before_action :find_test_from_question, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
        redirect_to test_path(@test), notice: "Вопрос успешно создан"
    else
        render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@test), notice: "Вопрос успешно обновлён"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@test), notice: "Вопрос успешно удалён"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render plain: "Record not found", status: :not_found
  end

  def find_test_from_question
    @test = @question.test
  end
end
