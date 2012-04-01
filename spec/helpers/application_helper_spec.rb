module ApplicationHelper
  # Return a title on a per-page basis.
  def page_title
    base_title = "On Kee Jazz Band &raquo; Boston | Washington D.C."
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
end
