class Article
  include DataMapper::Gitfs::Resource
  resource_type :markdown
  property :title, String
  property :date, Date
  property :published, Boolean

  def uri
    base_path.gsub(/\.md/, '')
  end  
end
