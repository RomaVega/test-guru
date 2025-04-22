class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_test, only: %i[new create]
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

  def edit
  end

  def update
    @test = @question.test
    if @question.update(question_params)
      redirect_to test_path(@test), notice: "Вопрос успешно обновлён"
    else
      render :edit
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_path(@test), notice: "Вопрос успешно удалён"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render plain: "Record not found", status: :not_found
  end
end
