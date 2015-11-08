This is what is known as a self-referential database relationship. It is similar to other join table relationships like the one between users, addresses, and users_addresses (join table). However, instead of joining one table with the records in another table to form a many-to-many relationship, we have this self-referential relationship where one user is referencing another user. All that is required to make this relationship real is to create a relationships join table with a follower_id an followed_id column, both integers, rather than having 3 tables in total. Our “third table” is just a reference back to the users table.

Assuming you’re using ActiveRecord with Sinatra, create a new migration:

We will be using the ! (known as bang) to run terminal commands in Vi with \ to escape spaces 
