# frozen_string_literal: true

class TrashCompactor
  include NewlineInput

  def grand_total
    lines.map(&:split).transpose.map do |problem|
      operands = problem.reverse.drop(1).map(&:to_i)
      operands.reduce(&problem.last.to_sym)
    end.sum
  end

  def real_grand_total
    lines_spaces = lines.map { it.each_char.with_index.filter_map { |c, i| c == " " ? i : nil } }
    breaks = lines_spaces.first.select { |i| lines_spaces.all? { it.include?(i) } }

    problems = lines.map do |line|
      parts = []
      i = 0

      breaks.each do |break_i|
        parts << line[i...break_i]
        i = break_i + 1
      end

      parts << line[i..]
      parts
    end.transpose

    problems.map do |problem|
      operands = problem.reverse.drop(1)
      operands = operands.map { it.each_char.to_a }
      operands = operands.map(&:size).max.times.map do |i|
        operands
          .reverse
          .map { |x| x[-1 * (i + 1)] }
      end
      operands = operands.map { it.join.to_i }
      operands.reduce(&problem.last.strip.to_sym)
    end.sum
  end
end
