## Calculate standard errors from a Single Trait Model
## Written by Andres Legarra (available at https://artadia.blogspot.com/search?q=AIREML)

# Variance component estimates
ahat = c(0.033043, 0.21659)

# inverse of Average Information matrix (Sampling Variance)
AI = matrix(c(
      0.00052444, -0.00043742,
      -0.00043742, 0.00057151),
     ncol = 2)

require(MASS)
b = mvrnorm(10000,ahat,AI)
head(b)

# Calculate h2 and standard deviation of h2
h2=b[,1]/(b[,1]+b[,2])
summary(h2); sd(h2)


## Calculate standard errors from a Multi Trait Model

# Variance component estimates
ahat = c(0.32939E-01, 0.25672E-02, 0.25672E-02, 0.33435E-01, 0.21668, 0.58214E-01)

# inverse of AI matrix (Sampling Variance)
AI = matrix(c(
      0.52150E-03,  0.11458E-03,  0.24495E-04, -0.43503E-03, -0.99145E-04, -0.22051E-04,
      0.11458E-03,  0.24844E-03,  0.10549E-03, -0.99418E-04, -0.20660E-03, -0.90357E-04,
      0.24495E-04,  0.10549E-03,  0.42628E-03, -0.22186E-04, -0.90595E-04, -0.35064E-03,
      -0.43503E-03, -0.99418E-04, -0.22186E-04,  0.56958E-03,  0.13718E-03,  0.32600E-04,
      -0.99145E-04, -0.20660E-03, -0.90595E-04,  0.13718E-03,  0.26326E-03,  0.11973E-03,
      -0.22051E-04, -0.90357E-04, -0.35064E-03,  0.32600E-04,  0.11973E-03,  0.42847E-03
    ), ncol=6)

require(MASS)
b=mvrnorm(10000,ahat,AI)
head(b)

# Calculate h2 and standard deviation of h2
h2=b[,1]/(b[,1]+b[,4])
summary(h2); sd(h2)

# Calculate rg and standard deviation of rg
rg=b[,2]/(b[,1]*b[,3])^0.5
sd(rg, na.rm = T)
