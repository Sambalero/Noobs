require 'rubygems'
require 'sinatra'


get '/' do
  "This is the first deployment of the Noobs project app.
 The next deployment will feature
    a description of the Noobs project
    and (maybe) a form for getting public commentary."
end

get '/:name' do
 "YO!"

	@name = params[:name]
  @time = Time.now.to_s
	erb :hello
end

__END__
@@ layout
<html>
  <body>
   <%= yield %>
  </body>
</html>

@@ hello
<h3>Hello <%= @name %>! it's <%= @time %> at the server!</h3>
