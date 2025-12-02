# frozen_string_literal: true

require_relative "../day-02/gift_shop"

describe GiftShop, day: 2 do
  subject(:gift_shop) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
        1698522-1698528,446443-446449,38593856-38593862,565653-565659,
        824824821-824824827,2121212118-2121212124
      INPUT
    end

    it "finds invalid IDs", part: 1 do
      expect(gift_shop.invalid_ids.sum).to eq(1_227_775_554)
    end

    it "finds real invalid IDs", part: 2 do
      expect(gift_shop.real_invalid_ids.sum).to eq(4_174_379_265)
    end
  end

  it "finds invalid IDs", part: 1 do
    expect(gift_shop.invalid_ids.sum).to eq(54_234_399_924)
  end

  it "finds real invalid IDs", :slow, part: 2 do
    expect(gift_shop.real_invalid_ids.sum).to eq(70_187_097_315)
  end
end
