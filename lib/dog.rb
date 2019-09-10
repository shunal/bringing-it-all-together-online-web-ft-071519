require 'pry'
class Dog

attr_accessor :id, :name, :breed

def initialize(id: nil, name:, breed:)
  @name = name
  @breed = breed
  @id = id
end 

def self.create_table
  DB[:conn].execute("CREATE TABLE dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT);")
end 

def self.drop_table
  DB[:conn].execute("DROP table dogs;")
end

def self.new_from_db(array)
  new_dog = Dog.new(id: array[0], name: array[1], breed: array[2])
end

def self.find_by_name(name)
  DB[:conn].execute('SELECT * FROM dogs WHERE name = ?;', name)
end 

def save
  DB[:conn].execute("INSERT INTO dogs (name, breed) VALUES (?, ?);", self.name, self.breed)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
end 
end 