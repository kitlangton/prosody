# require 'spec_helper'
require 'nom_de_plume'

describe NomDePlume do
  let(:user) { double("user", first_name: "Kit", last_name: "Langton") }

  it "successfully generates a random nom de plume" do
    ndp = NomDePlume.new(user).generate
    expect(ndp).to match /\w+ \w+/
  end
end
