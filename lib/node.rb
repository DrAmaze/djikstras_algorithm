class Node
  attr_accessor :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def neighbors
    neighbors = []
    @in_edges.each do |edge|
      neighbors << edge.from_node
    end

    @out_edges.each do |edge|
      neighbors << edge.to_node
    end

    neighbors.uniq
  end
end
