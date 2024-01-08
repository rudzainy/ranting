module ApplicationHelper
  def render_modal(title: "", body: "")
    render(partial: '/layouts/modal', locals: { title: title, body: body })
  end
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
end
