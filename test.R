library(terra)
r <- terra::rast(ncols=100, nrows=100)
values(r) <- 1:ncell(r)
r2 <- r*2
file_name_1 <- file.path(tempdir(),"raster1.tif")
file_name_2 <- file.path(tempdir(),"raster2.tif")
vrt_filename <- file.path(tempdir(),"test.vrt")
terra::writeRaster(r, file_name_1)
terra::writeRaster(r2, file_name_2)
terra::vrt(c(file_name_1,file_name_2), filename = vrt_filename, overwrite=TRUE,
           options="-separate")
