class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  default_scope { order("created_at DESC") }

  def author
    user.nom_de_plume
  end
end
