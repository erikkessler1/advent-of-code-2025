# frozen_string_literal: true

class SecretEntrance
  include NewlineInput

  def password
    pointer = 50
    zeros = 0

    turns.each do |turn|
      pointer = (pointer + turn) % 100
      zeros += 1 if pointer.zero?
    end

    zeros
  end

  def real_password
    pointer = 50
    zeros = 0

    turns.each do |turn|
      distance = if turn.negative?
                   (100 - pointer) + (turn * -1)
                 else
                   pointer + turn
                 end

      zeros += distance / 100
      zeros -= 1 if turn.negative? && pointer.zero?
      pointer = (pointer + turn) % 100
    end

    zeros
  end

  private

  def turns
    lines.map do |line|
      value = line[1..].to_i
      line.start_with?("L") ? value * -1 : value
    end
  end
end
