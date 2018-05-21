require 'rspec'
require 'node'
require 'edge'

describe Node do
  describe '#initialize' do
    subject(:node) { Node.new(7) }

    it 'stores a value' do
      expect(node.value).to eq(7)
    end

    it 'initially sets in_edges as an empty array' do
      expect(node.in_edges).to be_an_instance_of(Array)
      expect(node.in_edges).to be_empty
    end

    it 'initially sets out_edges as an empty array' do
      expect(node.in_edges).to be_an_instance_of(Array)
      expect(node.out_edges).to be_empty
    end
  end

  describe '#neighbors' do
    subject(:node) { Node.new(7) }

    it 'returns empty array if there are no neighbors' do
      expect(node.neighbors.length).to eq(0)
    end

    let(:from_node1) { Node.new(1) }
    let(:from_node2) { Node.new(2) }
    let(:from_node3) { Node.new(3) }
    let(:from_node4) { Node.new(4) }
    let(:to_node1) { Node.new(11) }
    let(:to_node2) { Node.new(12) }
    let(:to_node3) { Node.new(13) }
    let(:to_node4) { Node.new(14) }

    it 'returns full list of nodes from in_edges' do
      edge1 = Edge.new(from_node1, node)
      edge2 = Edge.new(from_node2, node)
      edge3 = Edge.new(from_node3, node)
      edge4 = Edge.new(from_node4, node)

      expect(node.neighbors.length).to eq(4)
      expect(node.neighbors).to include(from_node1)
    end


    it 'returns full list of nodes from out_edges' do
      edge11 = Edge.new(node, to_node1)
      edge12 = Edge.new(node, to_node2)
      edge13 = Edge.new(node, to_node3)
      edge14 = Edge.new(node, to_node4)

      expect(node.neighbors.length).to eq(4)
      expect(node.neighbors).to include(to_node1)
    end

    it 'returns a full list of nodes from both in_edges and out_edges' do
      edge1 = Edge.new(from_node1, node)
      edge2 = Edge.new(from_node2, node)
      edge3 = Edge.new(from_node3, node)
      edge4 = Edge.new(from_node4, node)
      edge11 = Edge.new(node, to_node1)
      edge12 = Edge.new(node, to_node2)
      edge13 = Edge.new(node, to_node3)
      edge14 = Edge.new(node, to_node4)

      expect(node.neighbors.length).to eq(8)
      expect(node.neighbors).to include(to_node4)
      expect(node.neighbors).to_not include(edge12)
    end
  end
end
