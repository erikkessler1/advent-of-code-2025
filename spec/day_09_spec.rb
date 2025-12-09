# frozen_string_literal: true

require_relative "../day-09/movie_theater"

describe MovieTheater, day: 9 do
  subject(:movie_theater) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        7,1
        11,1
        11,7
        9,7
        9,5
        2,5
        2,3
        7,3
      INPUT
    end

    it "finds the max rectangle", part: 1 do
      expect(movie_theater.max_rectangle).to eq(50)
    end

    it "finds the max contained rectangle", part: 2 do
      expect(movie_theater.max_contained).to eq(24)
    end
  end

  it "finds the max rectangle", part: 1 do
    expect(movie_theater.max_rectangle).to eq(4_748_985_168)
  end

  it "finds the max contained rectangle", :slow, part: 2 do
    expect(movie_theater.max_contained).to eq(1_550_760_868)
  end
end
