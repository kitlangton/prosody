class User < ActiveRecord::Base
  has_many :comments
  has_many :haikus
  has_many :posts
  require 'ruby-dictionary'
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
    ndp = generate_nom_de_plume
    self.nom_de_plume = ndp.titleize
  end

  def generate_nom_de_plume
    first = generate_word_from first_name.to_s
    last = generate_word_from last_name.to_s
    ndp = [first,last].join(" ")
  end

  private


  def generate_word_from (name)
    dictionary = Dictionary.from_file('./lib/SuperDict.txt')
    length = name.length

    length.times do |i|
      values = dictionary.starting_with(name.to_s[0..length-i])
      values.select! { |word| word.length < 8 }
      if values.length > 10
        random_word = Random.rand(values.length)
        return values[random_word]
      end
    end
  end
end
