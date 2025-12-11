# frozen_string_literal: true

require_relative "../day-11/reactor"

describe Reactor, day: 11 do
  subject(:reactor) { described_class.new(input) }

  context "with sample input", :sample do
    let(:input) do
      <<~INPUT
        aaa: you hhh
        you: bbb ccc
        bbb: ddd eee
        ccc: ddd eee fff
        ddd: ggg
        eee: out
        fff: out
        ggg: out
        hhh: ccc fff iii
        iii: out
      INPUT
    end

    it "you", part: 1 do
      expect(reactor.you_paths).to eq(5)
    end
  end

  it "you", part: 1 do
    expect(reactor.you_paths).to eq(724)
  end

  it "svr", part: 2 do
    expect(reactor.svr_paths).to eq(473_930_047_491_888)
  end
end
