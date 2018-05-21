require 'rspec'
require 'graph'

describe Graph do
  describe '#initialize' do
    subject(:graph) { Graph.new }

    it 'creates a nodes object' do
      expect(graph.nodes).to be_an_instance_of(Hash)
    end

    it 'creates an edges object' do
      expect(graph.edges).to be_an_instance_of(Hash)
      expect(graph.edges[1]).to be_an_instance_of(Array)
    end
  end

  describe '#add' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    subject(:graph) { Graph.new }

    it 'adds a node to graph' do
      graph.add(node1)
      expect(graph.nodes).to_not be_empty

      graph.add(node2)
      expect(graph.nodes.length).to eq(2)
    end

    it 'does not connect newly added nodes to other nodes' do
      graph.add(node1)
      graph.add(node2)

      expect(graph.edges).to be_empty
    end

    it 'raises an exception if user attempts to add number or array to Graph' do
      expect{ graph.add(2) }.to raise_error("Graph only can add node")
      expect{ graph.add([]) }.to raise_error("Graph only can add node")
    end
  end

  describe '#connect_mutually' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    subject(:graph) { Graph.new }

    before(:each) do
      graph.add(node1)
      graph.add(node2)
    end

    it 'creates an edge between BOTH nodes' do
      graph.connect_mutually(node1, node2)
      expect(graph.edges.length).to eq(2)
      expect(node1.in_edges.length).to eq(1)
    end

    it 'raises an error if arguments are not nodes' do
      expect{ graph.connect_mutually(4, node1) }.to raise_error("Must connect node objects")
    end
  end

  describe '#connect' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    subject(:graph) { Graph.new }

    before(:each) do
      graph.add(node1)
      graph.add(node2)
    end

    it 'connects two edges' do
      graph.connect(node1, node2)
      expect(graph.edges.length).to eq(1)
      expect(node1.out_edges.length).to eq(1)
    end

    it 'raises an error if arguments are not nodes' do
      expect{ graph.connect(4, node1) }.to raise_error("Must connect node objects")
    end
  end

  describe '#neighbors' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    subject(:graph) { Graph.new }

    it 'returns an array of all neighboring nodes' do
      graph.add(node1)
      graph.add(node2)
      graph.connect(node1, node2)

      expect(graph.neighbors(node1).length).to eq(1)
    end
  end

  describe '#delete' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    subject(:graph) { Graph.new }

    it 'deletes appropriate node' do
      graph.add(node1)
      graph.add(node2)
      graph.connect(node1, node2)
      expect(graph.nodes.length).to eq(2)
      expect(graph.edges.length).to eq(1)

      graph.delete(node1.value)
      expect(graph.nodes.length).to eq(1)
      expect(graph.edges.length).to eq(0)
    end
  end

  describe '#Djikstras' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    let(:node3) { Node.new(3) }
    let(:node4) { Node.new(4) }
    let(:node5) { Node.new(5) }
    let(:node6) { Node.new(6) }
    subject(:graph) { Graph.new }

    before(:each) do
      graph.add(node1)
      graph.add(node2)
      graph.add(node3)
      graph.add(node4)
      graph.add(node5)
      graph.add(node6)
      graph.connect_mutually(node1, node2, 3)
      graph.connect_mutually(node1, node4, 5)
      graph.connect(node1, node5, 15)
      graph.connect_mutually(node2, node3, 1)
      graph.connect(node2, node4, 3)
      graph.connect(node3, node1, 5)
      graph.connect(node4, node5, 6)
      graph.connect_mutually(node2, node5, 6)
    end

    it 'finds the least costly path between neighboring nodes' do
      expect(graph.djikstras(node1)).to eq(3)
    end

    it 'does not traverse a one-directional node the incorrect direction' do
      expect(graph.djikstras(node5)).to_not eq(15)
    end

    it 'finds the least costly path between nodes' do
      expect(graph.djikstras(node1)).to eq(9)
      expect(graph.djikstras(node4)).to eq(9)
      expect(graph.djikstras(node5)).to eq(7)
    end

    it 'provides the appropriate error message if nodes are not connected' do

    end

  end
end
