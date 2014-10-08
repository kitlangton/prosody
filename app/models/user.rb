class User < ActiveRecord::Base
  has_many :haikus
  has_many :posts
  before_save :concoct_nom_de_plume
  require 'ruby-dictionary'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def concoct_nom_de_plume
    dictionary = Dictionary.from_file('./lib/SuperDict.txt')
    first = dictionary.starting_with(self.first_name.to_s[0..1])[-1]
    last = dictionary.starting_with(self.last_name.to_s[0..1])[-1]
    ndp = [first.capitalize,last.capitalize].join(" ")
    self.nom_de_plume = ndp
  end
end
