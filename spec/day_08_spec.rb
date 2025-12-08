# frozen_string_literal: true

require_relative "../day-08/playground"

describe Playground, day: 8 do
  subject(:playground) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        162,817,812
        57,618,57
        906,360,560
        592,479,940
        352,342,300
        466,668,158
        542,29,236
        431,825,988
        739,650,466
        52,470,668
        216,146,977
        819,987,18
        117,168,530
        805,96,715
        346,949,466
        970,615,88
        941,993,340
        862,61,35
        984,92,344
        425,690,689
      INPUT
    end

    it "finds circuits", part: 1 do
      expect(playground.connect(10)).to eq(40)
    end

    it "finds last connection", part: 2 do
      expect(playground.connect_all).to eq(25_272)
    end
  end

  it "circuits", :slow, part: 1 do
    expect(playground.connect(1000)).to eq(54_180)
  end

  it "last connection", :slow, part: 2 do
    expect(playground.connect_all).to eq(25_325_968)
  end
end
