require 'sinatra'
require 'grit'

set :port, 9000

get '/' do
  Dir.chdir '../content'
  g = Grit::Repo.new('../content')
  g.git.reset({:hard => true}, 'HEAD')
  g.git.pull({}, "origin", "master")
end
