# frozen_string_literal: true

class Laboratories
  include NewlineInput
  include Gridded

  def beam_splits
    beams = [[lines.first.size / 2, 0]]
    splits = 0

    loop do
      break if off_grid?(beams.first)

      new_beams = []

      beams.each do |(x, y)|
        if grid_value_at([x, y + 1]) == "^"
          new_beams << [x - 1, y + 1]
          new_beams << [x + 1, y + 1]
          splits += 1
        else
          new_beams << [x, y + 1]
        end
      end

      beams = new_beams.uniq
    end

    splits
  end

  def timelines
    beams = [[lines.first.size / 2, 0, 1]]

    loop do
      break if off_grid?(beams.first.take(2))

      new_beams = []

      beams.each do |(x, y, timelines)|
        if grid_value_at([x, y + 1]) == "^"
          new_beams << [x - 1, y + 1, timelines]
          new_beams << [x + 1, y + 1, timelines]
        else
          new_beams << [x, y + 1, timelines]
        end
      end

      # Merge beams. Add timelines
      beams = new_beams
              .group_by { it.take(2) }
              .map { |(x, y), to_merge| [x, y, to_merge.map(&:last).sum] }
    end

    beams.map(&:last).sum
  end
end
