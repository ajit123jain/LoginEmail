class Post
  include Mongoid::Document
  field :to, type: String
  field :subject, type: String
  field :content, type: String
  # belongs_to :author
  # validates_presence_of :name
  #has_many :posts
end
