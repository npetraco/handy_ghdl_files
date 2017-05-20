
set <- 0:255 # Set to sample from. This is just bytes:
n <- 16      # Sample size

samp <- sample(set, size = n, replace = T)
samp <- c(0,1,2,samp,255) # Put on 0 and 255 to be able to eyeball if correct format
samp
length(samp)

# Byte signals, little endian:
tmpj <- t(sapply(1:length(samp), function(xx){rev(as.numeric(intToBits(samp[xx]))[1:8])}))
#tmpj <- as.numeric(intToBits(255))[1:8]
tmpj


write.table(tmpj, 
            file = "/Users/npetraco/codes/HDL/vhdl/handy_files/file_io/tf1.txt",
            quote=F,
            row.names=F,
            col.names=F,
            sep="")


