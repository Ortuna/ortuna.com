module Ortuna
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    layout :site

    private
    def markdown_to_html(markdown, options = {})
      options.reverse_merge!(:autolink => true, :space_after_headers => true)
      parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      parser.render(markdown)
    end
  end
end
