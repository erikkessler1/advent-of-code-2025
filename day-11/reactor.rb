# frozen_string_literal: true

class Reactor
  include NewlineInput

  def you_paths
    to_visit = [["you", []]]
    paths = []

    loop do
      node, path = to_visit.shift
      break if node.nil?
      next paths << path if node == "out"

      new_path = path + [node]
      graph[node].each do |connection|
        to_visit << [connection, new_path]
      end
    end

    paths.count
  end

  def svr_paths
    must_visit = ["dac", "fft"]
    cache = {}

    paths(graph, "svr", must_visit, cache)
  end

  private

  def graph
    lines.to_h do |line|
      key, *connections = line.split
      [key[0...-1], connections]
    end
  end

  def paths(graph, node, must_visit, cache)
    return must_visit.empty? ? 1 : 0 if node == "out"

    key = [node, must_visit]
    return cache[key] if cache.key?(key)

    graph[node].map do |connection|
      paths(
        graph,
        connection,
        must_visit.reject { it == connection },
        cache
      )
    end.sum.tap do |count|
      cache[key] = count
    end
  end
end
