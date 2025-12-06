# frozen_string_literal: true

require_relative "../day-06/trash_compactor"

describe TrashCompactor, day: 6 do
  subject(:trash_compactor) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        123 328  51 64#{' '}
         45 64  387 23#{' '}
          6 98  215 314
        *   +   *   +
      INPUT
    end

    it "finds the grand total", part: 1 do
      expect(trash_compactor.grand_total).to eq(4_277_556)
    end

    it "finds the real grand total", part: 2 do
      expect(trash_compactor.real_grand_total).to eq(3_263_827)
    end
  end

  it "finds the grand total", part: 1 do
    expect(trash_compactor.grand_total).to eq(6_343_365_546_996)
  end

  it "finds the real grand total", part: 2 do
    expect(trash_compactor.real_grand_total).to eq(11_136_895_955_912)
  end
end
