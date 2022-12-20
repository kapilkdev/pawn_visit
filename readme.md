# problem
A pawn can move on 10x10 chequerboard horizontally, vertically and diagonally
by these rules:

1. 3 tiles moving North (N), West (W), South (S) and East (E)
2. 2 tiles moving NE, SE, SW and NW
3. Moves are only allowed if the ending tile exists on the board
4. Starting from initial position, the pawn can visit each cell only once

# Solution
For this problem I implemented Warnsdorff's Algorithm ruby.
I have also added test cases using rspec.
I followed single responsibility principle and oops concepts when I building the
architecture of this application.

## Warnsdorff's Algorithm
1. Mark the starting square as visited when initializing the chessboard.

2. On the board, there are still squares left to be visited.

3. Generate a list of valid unvisited moves from the current square.

4. Count the number of unvisited neighbors for each valid move.

5. Choose the move that has the least number of neighbors that haven't been visited yet and make a note of it as having been visited.

6. Chosen move update the current square.

7. If unvisited square exists, then all squares must have been visited. Conversely, the absence of a valid square indicates that not all squares have been visited.


## Ruby Version
  3.0.0

## Run Program
  ruby main.rb

## Example Output
  ```rb
    [[3, 2], [1, 0], [1, 3], [1, 6], [1, 9], [4, 9], [7, 9], [9, 7], [9, 4], [9, 1],
    [6, 1], [3, 1], [0, 1], [0, 4], [0, 7], [2, 9], [5, 9], [8, 9], [8, 6], [8, 3],
    [8, 0], [5, 0], [2, 0], [0, 2], [0, 5], [0, 8], [3, 8], [6, 8], [9, 8], [9, 5],
    [9, 2], [7, 0], [4, 0], [6, 2], [6, 5], [8, 7], [8, 4], [8, 1], [5, 1], [7, 3],
    [7, 6], [4, 6], [4, 3], [2, 1], [2, 4], [2, 7], [0, 9], [0, 6], [2, 8], [5, 8],
    [8, 8], [8, 5], [8, 2], [6, 4], [6, 7], [3, 7], [3, 4], [1, 2], [1, 5], [1, 8],
    [4, 8], [7, 8], [5, 6], [2, 6], [2, 3], [5, 3], [3, 5], [5, 7], [5, 4], [7, 2],
    [7, 5], [4, 5], [4, 2], [6, 0], [9, 0], [9, 3], [7, 1], [4, 1], [6, 3], [6, 6],
    [9, 6], [9, 9], [6, 9], [3, 9], [3, 6], [1, 4], [1, 7], [4, 7], [7, 7], [7, 4],
    [4, 4], [2, 2], [2, 5], [5, 5], [5, 2], [3, 0], [0, 0], [0, 3], [3, 3], [1, 1]]

  ```

So Output is array of array. Each sub-array indicates the position of the pawn in which first element is row and second one is column.

## setup Rspec
  gem install rspec

## Run Rspec
  rspec spec/file_name.rb
