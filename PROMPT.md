## Graph work sample
Graphs (i.e., nodes, edges, etc.) are a major component of data science, and in particular, a central underpinning of the technology we are building here at Human Dx.

## Objective:
For this project, the goal is to build a quick graph implementation, implement Dijkstra's algorithm, and write tests of their functionality.

While many graph libraries exist, we would like you to write a simple graph implementation that exposes the following public functionality:
* Add nodes to a graph
* Add edges to a graph
* Get neighboring nodes given a node
* (Optional) Remove nodes and edges from the graph

Additionally, please write a function that consumes an instance of your graph (and likely other parameters) and returns the result of running Dijkstra's algorithm on two nodes.

Finally, please write unit tests for the public functionality of you graph objects and for your Dijkstra's algorithm implementation. Our preference is for you to use an existing unit testing framework, but a script that makes the relevant assertions is also acceptable. Please include instructions for how to run your tests.

## Deliverables:
* A simple graph implementation with the public functionality mentioned above.
* An implementation of Dijkstra's algorithm.
* Unit tests for all public functions.
* README detailing your design decisions, resulting tradeoffs, and limitations of your implementations.

## Notes:
* Feel free to use the language of your choice (though, if you are comfortable in Python, that would be ideal).
* Please use good object-oriented design where applicable, including separation of public/private functionality and extensibility for future use-cases (e.g., expect someone to subclass your graph objects to implement additional functionality).
* Please write clear documentation so someone can quickly learn how to use your classes and functions.

## Engineering Principles to keep in mind:
* Simple. As simple as possible, but no simpler.
* Prescient. Anticipates future needs.
* Flexible. Separable and replaceable code.
* Intuitive. Good naming conventions, well-scoped methods, clear documentation describing important details, etc.
