Ortuna::App.controllers do
  get :index do
    @articles = Article.all(published: true, order: :date.desc)
    render :index
  end

  get :article, map: '/:path' do
    @article = Article.first(published: true, base_path: "#{params[:path]}.md")
    @title   = @article[:title]
    @content = markdown_to_html(@article[:markdown])
    render :article
  end
end
