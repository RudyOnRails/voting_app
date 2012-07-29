class Question < ActiveRecord::Base
  attr_accessible :title, :parent_id, :user_id
  
  belongs_to :parent
  belongs_to :user

  def add_vote
    
  end

end
