require 'sinatra'
require 'grit'

set :bind, '0.0.0.0'
set :port, 9000

post '/' do
  Dir.chdir '../content'
  g = Grit::Repo.new('../content')
  g.git.reset({:hard => true}, 'HEAD')
  g.git.pull({}, "origin", "master")
end
