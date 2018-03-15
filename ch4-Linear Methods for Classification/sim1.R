rm(list = ls()); gc(reset = TRUE)
library(mvtnorm)
num <- 1000
diag_value <- 0.0036
d1 <- rmvnorm(n = num, mean = c(-0.25, -0.25), sigma = diag(diag_value, 2))
d2 <- rmvnorm(n = num, mean = c(0.00, 0.00), sigma = diag(diag_value, 2))
d3 <- rmvnorm(n = num, mean = c(0.25, 0.25), sigma = diag(diag_value, 2))
x <- rbind(d1, d2, d3)
plot(x = c(-0.5, -0.5, 0.5, 0.5), y = c(-0.5, 0.5, -0.5, 0.5))
points(x = d1, col = 2)
points(x = d2, col = 3)
points(x = d3, col = 4)
y <- nnet::class.ind(as.factor(rep(c(1, 2, 3), each = num)))

colnames(x) <- c("x1", "x2")
colnames(y) <- paste0("y", 1:3)
dat <- cbind.data.frame(y, x)

# linear basis
lm_fit <- lm(cbind(y1, y2, y3) ~ ., data = dat)
fit_y <- lm_fit$fitted.values

table(rep(c(1, 2, 3), each = num), apply(fit_y, 1, which.max))

pca_x <- prcomp(x = x)
# project data to PC1
pca_x_pc1 <- (x %*% pca_x$rotation)[, 1]
plot(pca_x_pc1, fit_y[, 1], col = 2)
points(pca_x_pc1, fit_y[, 2], col = 3)
points(pca_x_pc1, fit_y[, 3], col = 4)


library(plot3Drgl)
scatter3D(x = x[, 1], x[,2], fit_y[, 1])

# quadratic basis
x <- cbind(x, "x3" = (x[,1])^2)
x <- cbind(x, "x4" = (x[,2])^2)
dat <- cbind.data.frame(y, x)
lm_fit <- lm(cbind(y1, y2, y3) ~ ., data = dat)
fit_y <- lm_fit$fitted.values

table(rep(c(1, 2, 3), each = num), apply(fit_y, 1, which.max))

pca_x <- prcomp(x = x)
# project data to PC1
pca_x_pc1 <- (x %*% pca_x$rotation)[, 1]
plot(pca_x_pc1, fit_y[, 1], col = 2)
points(pca_x_pc1, fit_y[, 2], col = 3)
points(pca_x_pc1, fit_y[, 3], col = 4)



################# The centriods not in a straight line ##################
rm(list = ls()); gc(reset = TRUE)
library(mvtnorm)
num <- 100
diag_value <- 0.0036
d1 <- rmvnorm(n = num, mean = c(-0.25, -0.25), sigma = diag(diag_value, 2))
d2 <- rmvnorm(n = num, mean = c(0.00, 0.00), sigma = diag(diag_value, 2))
d3 <- rmvnorm(n = num, mean = c(0.25, -0.25), sigma = diag(diag_value, 2))
x <- rbind(d1, d2, d3)
plot(x = c(-0.5, -0.5, 0.5, 0.5), y = c(-0.5, 0.5, -0.5, 0.5))
points(x = d1, col = 2)
points(x = d2, col = 3)
points(x = d3, col = 4)
y <- nnet::class.ind(as.factor(rep(c(1, 2, 3), each = num)))

colnames(x) <- c("x1", "x2")
colnames(y) <- paste0("y", 1:3)
dat <- cbind.data.frame(y, x)

# linear basis
lm_fit <- lm(cbind(y1, y2, y3) ~ ., data = dat)
fit_y <- lm_fit$fitted.values

table(rep(c(1, 2, 3), each = num), apply(fit_y, 1, which.max))
