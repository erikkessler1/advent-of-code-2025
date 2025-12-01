# frozen_string_literal: true

module NewlineInput
  def initialize(input)
    @lines = input.split("\n")
  end

  private

  attr_reader :lines
end
