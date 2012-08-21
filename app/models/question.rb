class Question < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :presence => true

  belongs_to :parent
  belongs_to :user
  has_many :votes

  def vote(user)
    if self.votes.where(:user_id => user).present?
      return nil
    else
      self.votes << Vote.new(:user => user)
      true
    end
  end

  def score()
    self.votes.count
  end

end 