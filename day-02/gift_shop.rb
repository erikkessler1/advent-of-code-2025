# frozen_string_literal: true

class GiftShop
  include NewlineInput

  def invalid_ids
    ranges.flat_map do |range|
      range.select do |id|
        invalid_id?(id)
      end
    end
  end

  def real_invalid_ids
    ranges.flat_map do |range|
      range.select do |id|
        real_invalid_id?(id)
      end
    end
  end

  private

  def invalid_id?(id)
    digits = Math.log10(id).floor
    return false if digits.even?

    digits = (digits + 1) / 2
    divisor = 10**digits

    left = id / divisor
    right = id % divisor

    left == right
  end

  def real_invalid_id?(id)
    digits = Math.log10(id).floor
    max_digits = (digits + 1) / 2

    (1..max_digits).any? do |size|
      # E.g., id=80808 with size=2 should return false
      next false unless ((digits + 1) % size).zero?

      remaining_id = id
      divisor = 10**size
      pattern = remaining_id % divisor

      loop do
        break true if remaining_id.zero?
        break false if remaining_id % divisor != pattern

        remaining_id /= divisor
      end
    end
  end

  def ranges
    lines.join.split(",").map do |range|
      start_id, end_id = range.split("-").map(&:to_i)
      (start_id..end_id)
    end
  end
end
