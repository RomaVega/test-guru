class AnswersController < ApplicationController
  before_action :find_answer, only: %i[update edit destroy]
  before_action :find_question, only: %i[new create]

  def new
    @answer = @question.answers.build
  end

  def edit; end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to edit_question_path(@question), notice: "Answer created"
    else
      render :new
    end
  end

  def update
    @answer.update(answer_params)
    redirect_to edit_question_path(@answer.question), notice: "Answer updated"
  end

  def destroy
    @test = @answer.question.test
    @answer.destroy
    redirect_to test_path(@test), notice: "Answer was successfully deleted"
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
