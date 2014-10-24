class User < ActiveRecord::Base
  require 'nom_de_plume'
  has_many :comments
  has_many :haikus
  has_many :posts
  before_create :concoct_nom_de_plume
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_invitation_accepted :concoct_nom_de_plume

  def nom_de_plume_short
    self.nom_de_plume.split[0] + " " +
      self.nom_de_plume.split[1][0] + "."
  end 

  def nom_de_plume_display
    self.nom_de_plume.upcase + "'S"
  end

  def concoct_nom_de_plume
    ndp = NomDePlume.new(self).generate
    self.nom_de_plume = ndp.titleize
  end

end
