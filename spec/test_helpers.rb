require 'pg'
require_relative '../lib/user'
require_relative '../lib/listing'

def reset_table
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE TABLE users, listings, availability, messages, bookings, ratings RESTART IDENTITY;")
  User.create(username: 'poshhouseperson', email: 'poshhouseperson@notadomain.com', password: 'password1', name: 'Isabel Stephenson')

  Listing.create(name: 'posthouse', country: 'United Kingdom', city: 'London', sleeps: '6', bedrooms: '4', bathrooms: '3', 
                 description: 'blah blah posh house blah blaaah', type: 'small castle', user_id: '1')
  Listing.create(name: 'The bath house', country: 'United Kingdom', city: 'London', sleeps: '5', bedrooms: '3', bathrooms: '2', 
                 description: 'has a swimmingpool', type: 'large house', user_id: '1')
  
  connection.exec("INSERT INTO availability (listing_id, dates) VALUES('1','2021-04-03');")

  connection.exec("INSERT INTO messages (listing_id, user_id, message) VALUES ('1', '1', 'What an amazing castle!');")
end
