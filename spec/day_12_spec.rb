# frozen_string_literal: true

require_relative "../day-12/christmas_tree_farm"

describe ChristmasTreeFarm, day: 12 do
  subject(:christmas_tree_farm) { described_class.new(input) }

  it "fits", part: 1 do
    expect(christmas_tree_farm.fits).to eq(425)
  end
end
