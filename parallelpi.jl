function montepi(n)
    hits = 0
    for i = 1:n
        #if point inside circle, increment hits
        hits += rand()^2 + rand()^2 < 1.0
    end
    return hits
end

function parallelpi(procs, samples)
    hits = 0
    #Array of references to tasks spawned on remote processors
    numProcs = length(procs)
    refs = Array(RemoteRef, numProcs)
    #Spawn the tasks on each CPU (asynchronous)
    for i = 1:numProcs
        refs[i] = @spawnat i montepi(samples)
    end
    #Fetch the results
    for i = 1:numProcs
        hits += fetch(refs[i])
    end
    totalSamples = samples * numProcs
    return 4.0 * hits / totalSamples
end

