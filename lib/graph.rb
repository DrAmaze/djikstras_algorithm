require_relative 'node'
require_relative 'edge'

class Graph
  attr_reader :nodes, :edges

  INFINITY = 1 << 64

  def initialize
    @nodes = {}
    @edges = Hash.new { |h, k| h[k] = [] }
  end

  def add(node)
    raise "Graph only can add node" unless node.instance_of?(Node)
    @nodes[node.value] = node
  end

  def connect_mutually(node1, node2, cost = 1)
    raise "Must connect node objects" unless node1.instance_of?(Node) && node2.instance_of?(Node)

    if !@nodes[node1.value]
      raise "From node doesn't exist"
    elsif !@nodes[node2.value]
      raise "To node doesn't exist"
    else
      connect(node1, node2, cost)
      connect(node2, node1, cost)
    end
  end

  def connect(from, to, cost = 1)
    raise "Must connect node objects" unless from.instance_of?(Node) && to.instance_of?(Node)

    edge = Edge.new(from, to, cost)
    @edges[edge.from_node.value] << edge
  end

  def neighbors(node)
    node.neighbors
  end

  def delete(value)
    @edges[value].each do |edge|
      edge.destroy!
    end

    @edges.delete(value)
    @nodes.delete(value)
  end

  def djikstras(source)
    @distance = {}
    @previous = {}
    @nodes.each do |value, node| #initialization
      @distance[node] = INFINITY #Unknown distance from source to vertex
      @previous[node] = -1 #Previous node in optimal path from source
    end

    @distance[source] = 0 #Distance from source to source

    unvisited_node = []
    nodes.each { |val, node| unvisited_node << val unless val.nil? }#All nodes initially in Q (unvisited nodes)

    while unvisited_node.size > 0
      u = nil;

      unvisited_node.each do |min|
        u = min if !u || (@distance[min] && @distance[min] < @distance[u])
      end

      break if (@distance[u] == INFINITY)

      unvisited_node = unvisited_node - [u]

      @nodes[u].keys.each do |vertex|
        alt = @distance[u] + @edges[u][vertex]

        if (alt < @distance[vertex])
          @distance[vertex] = alt
          @previous[vertex] = u  #A shorter path to v has been found
        end
      end
    end
  end

  private

  def distance(start_node, end_node)
    @edges.each do |edge|
      return edge.cost if edge.from_node == from_node and edge.to_node == to_node
    end
    nil
  end
end
