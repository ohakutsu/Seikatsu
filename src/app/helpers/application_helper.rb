# frozen_string_literal: true

module ApplicationHelper
  def page_title
    title = "Seikatsu"
    title = @page_title + " | " + title if @page_title
    title
  end

  def markdown_to_html(text)
    options = {
      filter_html: true,
      no_stules: true,
      escape_html: true,
      safe_links_only: true
    }
    extensions = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
