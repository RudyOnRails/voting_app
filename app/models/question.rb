class Question < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :presence => true
  validates_uniqueness_of :title

  belongs_to :parent
  belongs_to :user
  has_many :votes

  def vote(user)
    if self.votes.where(:user_id => user).present?
      return nil
    else
      self.votes << Vote.create(:user => user)
      true
    end
  end

  def downvote(user)
    if self.votes.where(:user_id => user).present?
      @vote = self.votes.where(:user_id => user)
      @vote.destroy_all
    else
      return nil
    end
  end

  def score()
    self.votes.count
  end

end 