# frozen_string_literal: true

module Gridded
  ADJACENT = [
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
    [-1, 0],
    [-1, 1]
  ].freeze

  def min_x = 0
  def min_y = 0
  def max_x = grid_lines[0].size - 1
  def max_y = grid_lines.size - 1

  def each_point
    grid_lines.each_with_index do |line, y|
      line.each_char.with_index do |value, x|
        yield [x, y], value
      end
    end
  end

  def on_grid?((x, y))
    x.between?(min_x, max_x) &&
      y >= min_y && y <= max_y
  end

  def off_grid?(...)
    !on_grid?(...)
  end

  def grid_value_at((x, y))
    grid_lines[y]&.send(:[], x)
  end

  def update_grid_value((x, y), value)
    grid_lines[y][x] = value
  end

  def grid_lines
    lines
  end
end
