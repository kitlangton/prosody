class User < ActiveRecord::Base
  has_many :haikus
  has_many :posts
  before_create :concoct_nom_de_plume
  require 'ruby-dictionary'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nom_de_plume_display
    self.nom_de_plume.upcase + "'S"
  end

  def concoct_nom_de_plume
    ndp = generate_nom_de_plume
    self.nom_de_plume = ndp.titleize
  end

  private

  def generate_nom_de_plume
    first = generate_word_from first_name.to_s
    last = generate_word_from last_name.to_s
    ndp = [first,last].join(" ")
  end

  def generate_word_from (name)
    dictionary = Dictionary.from_file('./lib/SuperDict.txt')
    length = name.length

    length.times do |i|
      values = dictionary.starting_with(name.to_s[0..length-i])
      if values.length > 8
        random_word = Random.rand(values.length)
        return values[random_word]
      end
    end
  end
end
