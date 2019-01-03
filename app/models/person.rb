class Person
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :login, type: String
end
