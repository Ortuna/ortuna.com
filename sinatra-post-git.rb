require 'sinatra'
require 'grit'

set :bind, '0.0.0.0'
set :port, 9000

post '/' do
  current_directory = Dir.pwd
  git_pull('/home/ortuna/content')
end

def git_pull(path)
  Dir.chdir path
  g = Grit::Repo.new(path)
  g.git.reset({:hard => true}, 'HEAD')
  g.git.pull({}, "origin", "master")
end
