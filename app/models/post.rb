class Post < ActiveRecord::Base
  belongs_to :user
  before_save :post_titleize
  validates :body, presence: true
  validates :title, presence: true

  private

  def post_titleize
    self.title = title.titleize
  end
end
