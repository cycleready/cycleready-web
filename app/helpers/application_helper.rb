module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "CycleReady"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def is_recognised?(path)
    recognized =  Rails.application.routes.recognize_path(path)
    return recognized[:controller] == params[:controller]
  end

  def is_active?(path)
    return "active" if current_page?(path) || is_recognised?(path)
  end

end
