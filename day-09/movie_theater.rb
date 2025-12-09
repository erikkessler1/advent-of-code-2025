# frozen_string_literal: true

class MovieTheater
  include NewlineInput

  def max_rectangle
    points = lines.map { it.split(",").map(&:to_i) }
    max_area = 0

    points.each do |(x_1, y_1)|
      points.each do |(x_2, y_2)|
        width = (x_1 - x_2).abs + 1
        height = (y_1 - y_2).abs + 1
        area = width * height
        max_area = area if area > max_area
      end
    end

    max_area
  end

  def max_contained
    points = lines.map { it.split(",").map(&:to_i) }
    lines = points.zip(points.drop(1) + [points.first])
    rectangle = points.combination(2)

    rectangle.reject do |rectangle|
      lines.any? do |line|
        intersect?(rectangle, line)
      end
    end.map do |((x_1, y_1), (x_2, y_2))|
      width = (x_1 - x_2).abs + 1
      height = (y_1 - y_2).abs + 1
      width * height
    end.max
  end

  private

  # Looking for cases like:
  #
  #     R
  #     LL
  #     R
  #
  def intersect?(rectangle, line)
    min_rx = rectangle.map(&:first).min
    max_rx = rectangle.map(&:first).max

    min_lx = line.map(&:first).min
    max_lx = line.map(&:first).max

    min_ry = rectangle.map(&:last).min
    max_ry = rectangle.map(&:last).max

    min_ly = line.map(&:last).min
    max_ly = line.map(&:last).max

    cross_line_x = min_rx < max_lx && max_rx > min_lx
    cross_line_y = min_ry < max_ly && max_ry > min_ly

    cross_line_x && cross_line_y
  end
end
