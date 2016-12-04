module ApplicationHelper
  def parse_md(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       autolink: true, tables: true)
    markdown.render(content)
  end

  def truncate_parse_md(content)
    truncate(content.squish, length: 50,
                             separator: /\w/,
                             omission: '&hellip;')
  end
end
