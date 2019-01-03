class Author
  include Mongoid::Document
  field :name, type: String
  validates_presence_of :name
  #has_many :posts
end
