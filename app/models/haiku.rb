class Haiku < ActiveRecord::Base
  belongs_to :user

  def title
    self.text.split(" ")[0] + " " + self.text.split(" ")[-1]
  end
end
