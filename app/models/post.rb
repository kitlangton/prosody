class Post < ActiveRecord::Base
  belongs_to :user
  before_save :post_titleize
  validates :body, presence: true
  validates :title, presence: true

  scope :published, -> { where.not(published_on: nil ) }
  scope :unpublished, -> { where(published_on: nil ) }

  def published?
    published_on != nil
  end

  def draft?
    published_on == nil
  end
  private

  def post_titleize
    self.title = title.titleize
  end
end
