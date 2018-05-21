class Edge
  attr_accessor :from_node, :to_node, :cost

  def initialize(from_node, to_node, cost = 1)
    @from_node = from_node
    @to_node = to_node
    @cost = cost

    @from_node.out_edges << self
    @to_node.in_edges << self
  end

  def destroy!
    @from_node.out_edges.delete(self)
    @to_node.in_edges.delete(self)

    @from_node, @to_node = nil
  end
end
