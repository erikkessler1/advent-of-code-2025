# frozen_string_literal: true

require_relative "../day-04/printing_department"

describe PrintingDepartment, day: 4 do
  subject(:printing_department) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
      INPUT
    end

    it "finds accessible rolls", part: 1 do
      expect(printing_department.accessible_rolls).to eq(13)
    end

    it "finds removable rolls", part: 2 do
      expect(printing_department.removable_rolls).to eq(43)
    end
  end

  it "finds accessible rolls", part: 1 do
    expect(printing_department.accessible_rolls).to eq(1460)
  end

  it "finds removable rolls", :slow, part: 2 do
    expect(printing_department.removable_rolls).to eq(9243)
  end
end
