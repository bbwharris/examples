#Settings
set :server, %w{mongrel webrick}
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile =>  'db/test.sqlite3.db'
)
