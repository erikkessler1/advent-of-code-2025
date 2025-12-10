# frozen_string_literal: true

require_relative "../day-10/factory"

describe Factory, day: 10 do
  subject(:factory) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
        [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
        [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
      INPUT
    end

    it "lights", part: 1 do
      expect(factory.lights.sum).to eq(7)
    end

    it "jolts", part: 2 do
      expect(factory.jolts.sum).to eq(33)
    end
  end

  it "lights", part: 1 do
    expect(factory.lights.sum).to eq(409)
  end

  # VERY SLOW!
  it "jolt", :slow, part: 2 do
    expect(factory.jolts.sum).to eq(15_489)
  end
end
