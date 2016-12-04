module ApplicationHelper
  def parse_md(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       autolink: true, tables: true)
    markdown.render(content).html_safe
  end

  def truncate_parse_md(content)
    truncated = truncate(content.squish, length: 255,
                                         separator: /\w/)
    parse_md(truncated)
  end
end
