module ApplicationHelper
  def question_header(question)
    question.persisted? ? "Edit Question" : "New Question"
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{author}/#{repo}", "https://github.com/#{author}/#{repo}", target: "_blank", rel: "noopener"
  end
end
