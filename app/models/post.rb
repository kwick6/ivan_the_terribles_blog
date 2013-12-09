class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      #safe
      find(:all, :conditions => ['title like ?', "%#{search}%"])
      #unsafe - SQL injection
    #   where("title like '%#{search}%'")
     else
       find(:all)
    end
  end
end
