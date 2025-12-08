# frozen_string_literal: true

class Playground
  include NewlineInput

  def connect(size)
    connects = distances.sort_by { _2 }.take(size).map(&:first)
    circuits = connects.map(&:to_set)

    loop do
      new_circuits = []
      merged = 0

      circuits.each do |circuit|
        target = new_circuits.find { it.intersect?(circuit) }
        if target.nil?
          new_circuits << circuit.dup
        else
          target.merge(circuit)
          merged += 1
        end
      end

      circuits = new_circuits
      break if merged.zero?
    end

    circuits.map(&:size).sort.reverse.take(3).reduce(:*)
  end

  def connect_all
    circuits = boxes.map { Set.new([it]) }
    connects = distances.sort_by { _2 }.map(&:first)

    connects.each do |(x, y)|
      c_x = circuits.find { it.include?(x) }
      c_y = circuits.find { it.include?(y) }
      next if c_x == c_y

      circuits.delete(c_x)
      circuits.delete(c_y)
      circuits << c_x.merge(c_y)

      return x[0] * y[0] if circuits.size == 1
    end
  end

  private

  def distance((x_a, y_a, z_a), (x_b, y_b, z_b))
    Math.sqrt(((x_a - x_b).abs**2) + ((y_a - y_b).abs**2) + ((z_a - z_b).abs**2))
  end

  def distances
    return @distances if defined?(@distances)

    @distances = {}

    boxes.each do |box_a|
      boxes.each do |box_b|
        next if box_a == box_b

        key = [box_a, box_b].sort
        @distances[key] = distance(box_a, box_b)
      end
    end

    @distances
  end

  def boxes
    @boxes ||= lines.map { it.split(",").map(&:to_i) }
  end
end
