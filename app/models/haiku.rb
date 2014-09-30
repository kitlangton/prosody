class Haiku < ActiveRecord::Base

  def title
    self.text.split(" ")[0] + " " + self.text.split(" ")[-1]
  end
end
