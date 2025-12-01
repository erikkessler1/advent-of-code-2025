# frozen_string_literal: true

shared_context "with loaded input", :day do
  let(:input) do
    next super() if RSpec.current_example.metadata[:sample]

    day = RSpec.current_example.metadata[:day]
    input_file = format("day-%02d/input.txt", day)

    File.read(input_file)
  end
end
