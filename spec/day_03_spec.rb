# frozen_string_literal: true

require_relative "../day-03/lobby"

describe Lobby, day: 3 do
  subject(:lobby) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        987654321111111
        811111111111119
        234234234234278
        818181911112111
      INPUT
    end

    it "finds max joltages", part: 1 do
      expect(lobby.max_joltages.sum).to eq(357)
    end

    it "finds max joltages (12)", part: 2 do
      expect(lobby.max_joltages_12.sum).to eq(3_121_910_778_619)
    end
  end

  it "finds max joltages", part: 1 do
    expect(lobby.max_joltages.sum).to eq(16_993)
  end

  it "finds max joltages (12)", part: 2 do
    expect(lobby.max_joltages_12.sum).to eq(168_617_068_915_447)
  end
end
