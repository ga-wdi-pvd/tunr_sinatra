ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "tunr_db"
)

<<<<<<< HEAD
=======
# Fix an issue with sinatra and Active Record where connections are left open
>>>>>>> solution_step_1
if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
<<<<<<< HEAD
end
=======
end
>>>>>>> solution_step_1
