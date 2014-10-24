class NomDePlume
  require 'ruby-dictionary'

  attr_reader :first_name, :last_name

  def initialize(person)
    @first_name = person.first_name
    @last_name = person.last_name
  end

  def generate
    # first = generate_word_from first_name.to_s
    # last = generate_word_from last_name.to_s
    first = "hey"
    last = "hey"
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
