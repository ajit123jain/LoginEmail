class Author
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  validates_presence_of :name
  #has_many :posts
end
