# frozen_string_literal: true

class Factory
  include NewlineInput

  def lights
    lines.map do |line|
      parts = line.split
      lights = parts.shift
      _ = parts.pop
      buttons = parts

      lights = lights[1...-1].reverse.tr(".#", "01").to_i(2)
      buttons = buttons.map { it[1...-1].split(",").map(&:to_i).map { |i| 10**i }.sum.to_s.to_i(2) }

      (1..buttons.size).flat_map do |i|
        buttons.combination(i).to_a
      end.select do |presses|
        presses.reduce(&:^) == lights
      end.map(&:size).min
    end
  end

  def jolts
    lines.map do |line|
      parts = line.split
      _ = parts.shift
      jolts = parts.pop
      buttons = parts

      jolts = jolts[1...-1].split(",").map(&:to_i)
      buttons = buttons.map { it[1...-1].split(",").map(&:to_i) }

      jolt(buttons, jolts)
    end
  end

  def jolt(buttons, jolts, total_presses = 0)
    return if jolts.any?(&:negative?)

    # Out of buttons to press. Did we reach 0?
    return jolts.sum.zero? ? total_presses : nil if buttons.empty?

    button = buttons.first
    remaining_buttons = buttons.drop(1)

    # Start with button that hits jolt with with the *fewest* wires
    # connected to it (i.e., is the most constrained).
    #
    # My other thought was to start with buttons that give the most
    # jolts (i.e., most bang-per-press).
    jolt_order = remaining_buttons.flatten.tally.sort_by(&:last).map(&:first)
    remaining_buttons = remaining_buttons.sort_by { [it.map { |b| jolt_order.index(b) }.min, it.size] }

    # If no remaining button hits the jolt, we must press the button
    # at least that many times since nothing else will.
    min_button = button.find { |b| remaining_buttons.none? { |rb| rb.include?(b) } }
    min_presses = min_button ? jolts[min_button] : 0
    max_presses = button.map { jolts[it] }.min

    best = nil

    (min_presses..max_presses).filter_map do |presses|
      next if best && (total_presses + presses >= best)

      new_jolts = jolts.dup
      button.each { new_jolts[it] -= presses }

      result = jolt(remaining_buttons, new_jolts, total_presses + presses)
      best = result if result && (best.nil? || result < best)

      result
    end.min
  end
end
