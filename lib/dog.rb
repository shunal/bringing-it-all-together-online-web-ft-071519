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

def save
  DB[:conn].execute("INSERT INTO dog (name, breed) VALUES (?, ?);", self.name, self.breed)
  @id = DB.execute("SELECT last_insert_rowid() FROM dogs")[0][0]
end 
end 