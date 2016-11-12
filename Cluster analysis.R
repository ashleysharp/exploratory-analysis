set.seed(1234)
x <- rnorm(12, mean=rep(1:3, each = 4), sd=0.2)
y <- rnorm(12, mean=rep(c(1,2,1), each = 4, sd=0.2))
plot(x, y, col = "blue", pch = 19, cex = 1)
text(x + 0.05, y + 0.05, labels = as.character(1:12))
df <- data.frame(x = x, y = y)
distxy <- dist(df)
hclustxy <- hclust(distxy)
plot(hclustxy)
dataMatrix <- as.matrix(df)[sample(1:12), ]
heatmap(dataMatrix)

kmeansObj <- kmeans(df, centers = 3)
kmeansObj$cluster

df$k <- kmeansObj$cluster
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

set.seed(12345)
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)

#add a pattern to the data
for(i in 1:40) {
        coinFlip <- rbinom(1, size = 1, prob = 0.5)
        if(coinFlip) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each = 5)
        }
}

heatmap(dataMatrix)
plot(rowMeans(dataMatrix), 40:1)


