# frozen_string_literal: true

class Lobby
  include NewlineInput

  def max_joltages
    lines.map do |battery|
      chars = battery.each_char.to_a
      max = nil
      i_max = nil

      chars.each_with_index do |c, i|
        next unless max.nil? || c > max
        next if i == chars.size - 1

        max = c
        i_max = i
      end

      max_2 = chars.drop(i_max + 1).max

      (max + max_2).to_i
    end
  end

  def max_joltages_12
    lines.map do |battery|
      chars = battery.each_char.to_a
      maxes = []
      l = -1

      12.times do
        r = chars.size - (12 - maxes.size)
        new_max = nil
        i = l + 1

        loop do
          break if i > r

          c = chars[i]
          if new_max.nil? || c > new_max
            new_max = c
            l = i
          end

          i += 1
        end

        maxes << new_max
      end

      maxes.join.to_i
    end
  end
end
