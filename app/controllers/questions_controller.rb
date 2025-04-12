class QuestionsController < ApplicationController
before_action :set_test, only: [:index, :show, :new, :create, :destroy]

def index
    @questions = @test.questions
    render plain: @questions.map { |q| q.body }.join("\n")
end

def show
    @question = @test.questions.find(params[:id])
    render plain: @question.body 
rescue ActiveRecord::RecordNotFound
    render plain: "Question not found", status: :not_found
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
    @question = @test.questions.find(params[:id])
    @question.destroy
    render plain: "Вопрос удалён"
rescue ActiveRecord::RecordNotFound
    render plain: "Вопрос не найден", status: :not_found
end

private

def set_test
    @test = Test.find(params[:test_id])
rescue ActiveRecord::RecordNotFound
    render plain: "Тест не найден", status: :not_found
end

def set_question
    @question = Questions.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render plain: "Вопрос не найден", status: :not_found
end

def question_params
    params.require(:question).permit(:content)
end
end
