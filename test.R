install.packages("terra")

library(terra)

url <- "/vsizip/vsicurl/https://naciscdn.org/naturalearth/10m/raster/SR_LR.zip/SR_LR.tif"
set.seed(1)
pts <- cbind(x = runif(44000, -180, 180), y = runif(44000, -90, 90))
pts <- vect(pts, crs = "EPSG:4326")

r <- rast(url)
inMemory(r)

extr <- extract(r, pts, cells = TRUE, xy = TRUE, ID = FALSE)
sum(is.na(extr$SR_LR))
head(extr[is.na(extr$SR_LR), ])
