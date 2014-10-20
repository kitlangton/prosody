class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  before_save :post_titleize
  before_save :name_haiku

  validates :body, presence: true
  validates :title, presence: true

  scope :published, -> { where.not(published_on: nil ) }
  scope :unpublished, -> { where(published_on: nil ) }

  def publish!
     update(published_on: DateTime.now)
  end

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

  def name_haiku
    if post_type == "haiku"
      new_title = body.split[0].capitalize + " " + body.split[-1].capitalize
      self.title = new_title
    end
  end
end
