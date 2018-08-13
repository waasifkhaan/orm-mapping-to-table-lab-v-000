class Student
attr_accessor :name, :grade
attr_reader :id

def initialize(name, grade, id= nil)
  @id = id 
  @name = name
  @grade = grade 
end 

def self.create_table
  sql =  <<-SQL 
  CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY, 
  name TEXT, 
  grade INTEGER)
  SQL
  DB[:conn].execute(sql)
end 
def self.drop_table
  drop =  <<-SQL 
    DROP TABLE students 
    SQL
  DB[:conn].ececute(drop)
end 

def save 
  insert = <<-SQL
  INSERT INTO students(name, grade) VALUES ( ?, ?)  
  SQL
  DB[:conn].execute(insert,self.name, self.grade)
end 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
end
