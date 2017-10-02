# Exercise 3: Vector and function practice

# Create a vector `marbles` with 6 different colors in it (representing marbles)
marbles <- c("red", "blue", "blue", "red", "red", "red")

# Use the `sample` function to select a single marble
my.marble <- sample(marbles, 1)

# Write a function MarbleGame that does the following:
# - Takes in a `guess` of a marble color
# - Randomly samples a marble
# - Returns whether or not the person guessed accurately (preferrably a full phrase)
MarbleGame <- function(guess) {
  marble <- sample(marbles, 1)
  if (marble == guess) {
    print("Winner, winner, chicken dinner!")
  } else {
    print("Too bad :( try again")
  }
}

# Play the marble game!
MarbleGame("red")

# Bonus: Play the marble game until you win, keeping track of how many tries you take
not.won <- T
tries <- 0
while(not.won) {
  result <- MarbleGame("blue")
  if (result == "Winner, winner, chicken dinner!") {
    not.won = F
  }
  tries = tries + 1
}
print(tries)

## Double bonus(answer not provided): play the game 1000X (until you win) and track the average number of tries
# Is it what you expected based on the probability
MarbleGameFaster <- function(guess) {
  marble <- sample(marbles, 1)
  if (marble == guess) {
    return("Winner, winner, chicken dinner!")
  } else {
    return("Too bad :( try again")
  }
}

game <- 1
log.results <- c()
while (game < 1000) {
  not.won <- T
  tries <- 0
  while(not.won) {
    result <- MarbleGameFaster("blue")
    if (result == "Winner, winner, chicken dinner!") {
      not.won = F
    }
    tries = tries + 1
  }
  log.results <- c(log.results, tries)
  game <- game + 1
}
result <- sum(log.results) / length(log.results)
print(result)
# My answer is consistently around 3 - makes sense since probability of a blue marble is 1/3