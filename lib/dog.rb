class Dog

attr_accessor :id, :name, :breed

def initialize(id: nil, name:, breed:)
  @name = name
  @breed = breed
  @id = id
end 

def self.create_table
  
end 

def self.drop_table
  DROP table dogs;
end 
end 