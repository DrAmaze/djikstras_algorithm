# Solution Overview

The following solution contains a functioning graph class written in Ruby, with tests written in RSpec.  It features nodes and edges that connect nodes.  The edges feature a cost and a direction, and the nodes feature an identifying value.  There are specs written for each of the functions found in each of the three classes.

Clone this file and open it in terminal.  To run the tests, first run `bundle install`, then run `be rspec` in your command line.

## Design

* Directional Edges
  - The edges are directional so as to allow for weighted graphs, allowing for greater flexibility from the designer.
  - The shortcomings of this design are that Djikstras algorithm will take longer to run.

* Including `Node#neighbors`
  - I chose to put a `#neighbors` function in the Node class for ease of reading in the graphs.
  - The shortcomings of this choice are that the Graph class calls a function within another class
  - By making the `.uniq` call at the end of the function, the time complexity of this function doubles. It is a linear function, so the tradeoff was deemed acceptable.

* Djikstras
  - This code is currently inaccurate.
  - My design runs in quadratic time complexity O(n^2) where n is the number of nodes in the graph.
  - The attempt was made to store the weights of each path in a `weight` object, then to return the lowest weighted path as the solution.
  - I struggled to adequately store the appropriate values as keys in the `weight` object.

## Shortcomings
* Time spent writing comprehensive unit tests
  - By writing comprehensive unit testing, I was unable to spend adequate time on the problem at hand: implementing Djikstras algorithm. I was unable to optimize the solution into a functioning script.

* Djikstras Incomplete
  - I spent way too much of the allotted time working on perfecting the graph code versus working on the algorithm, which was the purpose of this assignment.  I recognize my prioritization was ineffective.
