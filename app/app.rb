module Ortuna
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    layout :site
    
    enable :caching
    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]

    private
    def markdown_to_html(markdown, options = {})
      options.reverse_merge!(
        :autolink => true,
        :gh_blockcode => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :strikethrough => true,
        :lax_html_blocks => true,
        :superscript => true
      )
      parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      parser.render(markdown)
    end
  end
end
