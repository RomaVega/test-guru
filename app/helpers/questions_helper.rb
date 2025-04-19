module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "create"
    else
      "edit"
    end
  end
end
