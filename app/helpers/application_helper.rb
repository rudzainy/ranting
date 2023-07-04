module ApplicationHelper
  def render_modal(title: "", body: "")
    render(partial: '/layouts/modal', locals: { title: title, body: body })
  end
end
