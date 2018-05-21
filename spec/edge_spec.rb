require 'rspec'
require 'node'
require 'edge'

describe Edge do
  let(:from_node) { Node.new(nil) }
  let(:to_node) { Node.new(nil) }
  subject(:edge) { Edge.new(from_node, to_node) }

  describe '#initialize' do
    it 'stores a from_node' do
      expect(edge.from_node).to be(from_node)
    end

    it 'stores a to_node' do
      expect(edge.to_node).to be(to_node)
    end

    it 'stores a cost which defaults to 1' do
      expect(edge.cost).to eq(1)
    end

    it "adds itself to the to_node's edges" do
      expect(to_node.in_edges).to include(edge)
    end

    it "adds itself to the from_node's edges" do
      expect(from_node.out_edges).to include(edge)
    end
  end

  describe '#destroy' do
    before(:each) do
      edge.destroy!
    end

    it "deletes itself from its to_node and from_node's edges" do
      expect(to_node.in_edges).to_not include(edge)
      expect(from_node.out_edges).to_not include(edge)
    end

    it "sets its vertices to nil" do
      expect(edge.from_node).to be_nil
      expect(edge.to_node).to be_nil
    end
  end
end
