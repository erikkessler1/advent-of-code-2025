# frozen_string_literal: true

require_relative "../day-01/secret_entrance"

describe SecretEntrance, day: 1 do
  subject(:secret_entrance) { described_class.new(input) }

  it "finds the password", part: 1 do
    expect(secret_entrance.password).to eq(1_026)
  end

  it "finds the real password", part: 2 do
    expect(secret_entrance.real_password).to eq(5_923)
  end
end
