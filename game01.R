# Flip a coin or play the lotto?

B <- 500

num.Coin <- 0
num.Coin.Win <- 0

num.Lotto <- 0
num.Lotto.Win <- 0

for (i in 1:B){

print("")
print("********** ========== New Game!! ========== **********")
print("")
print("Number of games played: ")
print("")
print("")
print("")
print("What game do you want to play?")
print("   Flip a Coin or 6-digit Lotto?")
print("   Enter 1 for Flip a Coin to get a H.")
print("   Enter 2 for match a 6-digit Lotto number.")
print("   This about which game you will have a better chance at winning?")
game <- readline("Enter 1 or 2: Or 3 to Quit: ")
print(game)

if (game == 3){
  print("Bye-bye.")
  break
} else { 

if (game == 1){ 
  print("Your Game is Flip a Coin to get a H.")
  x <- 0
  x <- sample(0:1, 1)
  if (x > 0) {
    print("You got a H.  You win!!!")
    num.Coin <- num.Coin + 1
    num.Coin.Win <- num.Coin.Win + 1
  } else {
    print("You got a T.  You loose!!!")
    num.Coin <- num.Coin + 1
  }
} else {
  print("Your Game is match a 6-digit Lotto number.")
  number <- readline("Enter your 6-digit number:  ")
  x <- as.numeric(paste(sample(0:9, 6), collapse = ""))
  cat("The lotto number is: ")
  print(as.integer(x))
  if (number == x) {
    print("You matched the lotto number.  You win!!!")
    num.Lotto <- num.Lotto + 1
    num.Lotto.Win <- num.Lotto.Win + 1
  } else {
    print("You did not match the lotto number.  You loose!!!")
    num.Lotto <- num.Lotto + 1
  }
}

print("")
print("Press Enter to continue.")
readline()

print("")
print("Number of Coin Flip games: ")
print(num.Coin)
print("Precentage/Probability of Coin Flip Wins: ")
print(num.Coin.Win/num.Coin)

print("")
print("Number of Lotto games: ")
print(num.Lotto)
print("Precentage/Probability of Lotto Wins: ")
print(num.Lotto.Win/num.Lotto)

if(i %% 20==0) {
  if (num.Coin > 5) {
    x.bar <- c(num.Coin.Win/num.Coin, 1-num.Coin.Win/num.Coin)
    names(x.bar) <- c("Win", "Loose")
    X11()
    barplot(x.bar, main=paste("Plot: ",i," Flip a Coin"))
    
    pdf(paste("CoinOutput",i,".pdf", sep=""))
      barplot(x.bar, main=paste("Plot: ",i," Flip a Coin"))
    dev.off()
    
  }
  if (num.Lotto > 5) {
    y.bar <- c(num.Lotto.Win/num.Lotto, 1-num.Lotto.Win/num.Lotto)
    names(y.bar) <- c("Win", "Loose")
    X11()
    barplot(y.bar, main=paste("Plot: ",i," Lotto"))
    
    pdf(paste("LottoOutput",i,".pdf", sep=""))
      barplot(y.bar, main=paste("Plot: ",i," Lotto"))
    dev.off()
    
  }
}

}

}

