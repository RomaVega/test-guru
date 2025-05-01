class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.build
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.correct = true if @question.answers.empty?

    if @answer.save
      redirect_to edit_question_path(@question), notice: "Answer was successfully created."
    else
      @question = @answer.question
      render "questions/edit"
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: "Answer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @test = @question.test
    redirect_to test_path(@question.test), notice: "Answer was successfully destroyed."

    respond_to do |format|
      format.html { redirect_to edit_question_path(@answer.question), notice: "Answer deleted" }
      format.turbo_stream
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
