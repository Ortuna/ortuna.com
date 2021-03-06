Ortuna::App.controllers do
  get :index do
    @title    = 'Articles'
    @articles = Article.all(published: true, order: :date.desc)
    render :index
  end

  get :about do
    @title = 'Sumeet Singh'
    render :about
  end

  get :article, map: '/:path' do
    @article = Article.first(published: true, base_path: "#{params[:path]}.md")
    if @article
      @title   = @article[:title]
      @content = markdown_to_html(@article[:markdown])
      render :article
    else
      render '404'
    end
  end
end
