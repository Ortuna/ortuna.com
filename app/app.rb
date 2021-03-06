module Ortuna
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Pipeline

    enable :sessions
    layout :site
    
    enable :caching
    configure_assets do |config|
    	config.pipeline = Padrino::Pipeline::Sprockets
    end

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
