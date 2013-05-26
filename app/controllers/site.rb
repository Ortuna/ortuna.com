Ortuna::App.controllers do
  get :index do
    @articles = Article.all
    render :index
  end

  get :article, map: '/:path' do
    @article = Article.first(base_path: "#{params[:path]}.md")
    @title   = @article[:title]
    @content = markdown_to_html(@article[:markdown])
    p @content
    render :article
  end
end
