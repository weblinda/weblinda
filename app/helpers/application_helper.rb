module ApplicationHelper
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output
  end

  def title(title)
    content_for(:title) { title }
  end
end
