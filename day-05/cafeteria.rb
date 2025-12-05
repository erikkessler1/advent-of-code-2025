# frozen_string_literal: true

class Cafeteria
  include NewlineInput

  def fresh
    divider = lines.index("")

    ranges = lines.take(divider).map do |line|
      l, r = line.split("-").map(&:to_i)
      (l..r)
    end

    lines.drop(divider + 1).select do |line|
      id = line.to_i
      ranges.any? { it.cover?(id) }
    end
  end

  def all_fresh_count
    divider = lines.index("")

    ranges = lines.take(divider).map do |line|
      l, r = line.split("-").map(&:to_i)
      (l..r)
    end
    ranges.sort_by!(&:first)

    combined_ranges = []
    ranges.each do |range|
      last_range = combined_ranges.pop
      next combined_ranges << range if last_range.nil?

      if last_range.overlap?(range)
        new_end = [last_range.last, range.last].max
        combined_ranges << (last_range.first..new_end)
      else
        combined_ranges << last_range
        combined_ranges << range
      end
    end

    combined_ranges.map(&:size).sum
  end
end
