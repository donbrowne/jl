##For a multicore machine…

#‘nprocs()’ is a function returning the number of available cores
#‘@parallel (+) for’ is a parallel reduction loop

samples = 1000000

pi = 4.0 * (@parallel (+) for i = 1:nprocs()
        montepi(samples)
end) / (samples * nprocs())
