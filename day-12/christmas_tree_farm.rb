# frozen_string_literal: true

class ChristmasTreeFarm
  include NewlineInput

  def fits
    problems = lines.drop(30)
    sizes = 6.times.map do |i|
      i = (i * 5) + 1
      lines.drop(i).take(3).join.count("#")
    end

    problems.select do |problem|
      dimensions, counts = problem.split(": ")
      counts = counts.split.map(&:to_i)
      area = eval(dimensions.tr("x", "*"))
      needed_area = counts.map.with_index { |count, i| sizes[i] * count }.sum

      area > needed_area
    end.count
  end
end
