# frozen_string_literal: true

require_relative "../day-05/cafeteria"

describe Cafeteria, day: 5 do
  subject(:cafeteria) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
      INPUT
    end

    it "finds fresh", part: 1 do
      expect(cafeteria.fresh.count).to eq(3)
    end

    it "counts all fresh", part: 2 do
      expect(cafeteria.all_fresh_count).to eq(14)
    end
  end

  it "finds fresh", part: 1 do
    expect(cafeteria.fresh.count).to eq(638)
  end

  it "counts all fresh", part: 2 do
    expect(cafeteria.all_fresh_count).to eq(352_946_349_407_338)
  end
end
