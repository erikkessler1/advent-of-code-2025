# frozen_string_literal: true

class PrintingDepartment
  include NewlineInput
  include Gridded

  def accessible_rolls
    rolls = 0

    each_point do |(x, y), value|
      next unless value == "@"

      count = ADJACENT.select do |(dx, dy)|
        nx = x + dx
        ny = y + dy
        next if off_grid?([nx, ny])

        grid_value_at([nx, ny]) == "@"
      end.count

      rolls += 1 if count < 4
    end

    rolls
  end

  def removable_rolls
    rolls = 0

    loop do
      removed = 0

      each_point do |(x, y), value|
        next unless value == "@"

        count = ADJACENT.select do |(dx, dy)|
          nx = x + dx
          ny = y + dy
          next if off_grid?([nx, ny])

          grid_value_at([nx, ny]) == "@"
        end.count

        next unless count < 4

        rolls += 1
        removed += 1
        update_grid_value([x, y], ".")
      end

      break if removed.zero?
    end

    rolls
  end
end
