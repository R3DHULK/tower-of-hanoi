# Define a function to display the game board
display_board <- function(board) {
  for (i in seq_along(board)) {
    cat(i, ": ", paste(rep(" ", 3 - board[i]), collapse = ""), rep("*", board[i]), "\n")
  }
}

# Define a recursive function to solve the puzzle
solve_hanoi <- function(n, from_peg, to_peg, aux_peg) {
  if (n == 1) {
    cat("Move disk 1 from peg", from_peg, "to peg", to_peg, "\n")
    return()
  }
  solve_hanoi(n - 1, from_peg, aux_peg, to_peg)
  cat("Move disk", n, "from peg", from_peg, "to peg", to_peg, "\n")
  solve_hanoi(n - 1, aux_peg, to_peg, from_peg)
}

# Define the main function for the game
play_game <- function() {
  cat("Welcome to the Tower of Hanoi game!\n\n")
  
  # Prompt the player to enter the number of disks
  while (TRUE) {
    num_disks <- as.integer(readline(prompt = "Enter the number of disks (3-8): "))
    if (num_disks %in% 3:8) {
      break
    }
    cat("Invalid input. Try again.\n")
  }
  
  # Initialize the game board
  board <- rep(0, num_disks)
  board[1] <- num_disks
  
  # Start the game
  while (TRUE) {
    # Display the game board
    cat("\nCurrent game board:\n")
    display_board(board)
    
    # Prompt the player to make a move
    while (TRUE) {
      move <- readline(prompt = "Enter the move (e.g. 1-2): ")
      if (grepl("^\\d+-\\d+$", move)) {
        move <- as.integer(strsplit(move, "-")[[1]])
        if (move[1] %in% 1:num_disks & move[2] %in% 1:num_disks & move[1] != move[2]) {
          break
        }
      }
      cat("Invalid input. Try again.\n")
    }
    
    # Check if the move is valid
    from_peg <- move[1]
    to_peg <- move[2]
    if (board[from_peg] == 0 | (board[to_peg] != 0 & board[to_peg] <= board[from_peg])) {
      cat("Invalid move. Try again.\n")
      next
    }
    
    # Make the move
    board[to_peg] <- board[from_peg]
    board[from_peg] <- 0
    
    # Check if the game is won
    if (board[num_disks] == num_disks & all(board[1:(num_disks-1)] == 0)) {
      cat("\nCongratulations, you won!\n\n")
      solve_hanoi(num_disks, 1, 3, 2)
      break
    }
  }
}

# Start the game
play_game()
