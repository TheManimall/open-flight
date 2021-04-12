require 'rails_helper'

RSpec.describe Airline, type: :model do
  it "reverse an ABC" do
    airline = Airline.new
    allow(airline).to receive(:name).and_return("ABC")

    expect(airline.name_reverse).to eq("CBA")
  end
end
