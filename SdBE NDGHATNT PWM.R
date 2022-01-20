#define the frequencies of nucleotides
A <- c(3, 8, 4, 14, 1, 3, 0, 3, 4, 5, 5, 4)
C <- c(0, 1, 8, 0, 1, 0, 8, 5, 1, 6, 1, 3)
G <- c(8, 1, 1, 0, 0, 1, 0, 3, 2, 3, 7, 4)
T <- c(3, 4, 1, 0, 12, 10, 6, 3, 7, 0, 1, 3)
#function for working out the position weight matrix value
pwm <- function (freq, total, bg=0.25){
  p <- (freq + (sqrt(total) * 1/4)) / (total + (4 * (sqrt(total) * 1/4)))
  log2(p/bg)
  }
#now let's create  a PFM
PFM <- matrix(data = c(A,C,G,T), nrow = 4, byrow = T, dimnames = list(c('A', 'C', 'G', 'T')))
#print the matrix
PFM
#now let's create the PWM
PWM <- pwm(PFM, 12)
PWM
#now we can define our Sd binding element sequences and use those to match the PWM above
seq1 <- 'GGTATTTAGTAT'
seq2 <- 'ACCATTCCTACT'
#we now split the strings as separate characters
seq1_split <- strsplit(x = seq1, split = '')
seq2_split <- strsplit(x = seq2, split = '')
#check by printing 
seq1_split
seq2_split
#so now we need to create a vector which will store the score for our seq1 and seq2
seq_score1 <- vector()
seq_score2 <- vector()
#now we need to get the ith values from the PWM based on seq1 and seq2 and store it in these vectors we just made
#getting the ith values
for (i in 1:12){
  seq_score1[i] <- PWM[seq1_split[[1]][i], i]
  }
for (i in 1:12){
  seq_score2[i] <- PWM[seq2_split[[1]][i], i]
  }
#now print both the scores
seq_score1
seq_score2
#now let's calculate the sum of these scores
sum1 <- sum(seq_score1)
sum1
sum2 <- sum(seq_score2)
sum2
#max score
max_score <-sum(apply(PWM, 2, max))
max_score
#minimum scores
min_score <-sum(apply(PWM, 2, min))
min_score
#relative scores for both sequences
rel_score1 <- (sum1 - min_score)/(max_score-min_score)*100
rel_score2 <- (sum2 - min_score)/(max_score-min_score)*100
#print relative scores
rel_score1
rel_score2
#let's create a dataframe for generating our seq logo
df <- data.frame(A, C, G, T)
df
#define a function proportion
proportion <-function(x){
  rs <-sum(x);
  return
  (x / rs);
  }
#create position weight matrix
Sd <- apply (df, 1, proportion)
Sd <-makePWM (Sd)
seqLogo (Sd)