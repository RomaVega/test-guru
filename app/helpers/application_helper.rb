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

def delete_resource_button(resource, options = {})
  link_to(
    "×",
    resource,
    method: :delete,
    data: {
      turbo_method: :delete,
      turbo_confirm: options[:confirm_message] || "DELETE: are you sure?"
    },
    class: "delete-link",
    style: "text-decoration: none; color: #999; margin-left: 5px; font-size: 1.2em;"
  )
  end
end
