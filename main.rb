require './converter.rb'
require './app/workers/autosave_worker.rb'
require 'pg'
require 'date'


begin
  con = PG.connect :dbname => 'exchanger_development', :user => 'dkdottk', :password => "11111111"
  date = 'latest'
  json = Request.new.get_json(date)['rates']
  date = con.exec "SELECT created_at FROM request WHERE id=(SELECT max(id) FROM request)"
  if Date.today.strftime("%Y-%m-%d") != date.values.first
    con.exec "INSERT INTO request (data, created_at) VALUES('#{json}','#{Date.today.strftime("%Y-%m-%d")}')"
  end
rescue PG::Error => e
  puts e.message
ensure
  con.close if con
end

session = Converter.new
session.input
session.calculate
session.output

