require 'sinatra'
require 'grit'

set :bind, '0.0.0.0'
set :port, 9000

post '/' do
  update_origin
  update_tmp
end

def update_origin
  Dir.chdir '../content'
  g = Grit::Repo.new('../content')
  g.git.reset({:hard => true}, 'HEAD')
  g.git.pull({}, "origin", "master")
end

def update_tmp
  Dir.chdir '/tmp/ortuna-content'
  g = Grit::Repo.new('/tmp/ortuna-content')
  g.git.reset({:hard => true}, 'HEAD')
  g.git.pull({}, "origin", "master")
end
