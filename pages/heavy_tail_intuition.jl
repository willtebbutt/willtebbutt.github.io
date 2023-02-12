using
    Distributions,
    Plots,
    Random

function main()
    N = 10 .^ (0:5)
    @show N

    d0 = TDist(1.0)
    x = rand(Xoshiro(123456), d0, N[end])
    display(extrema(x))
    println()
end

# Goals:
# Provide intuition for how quickly one can infer the tail parameter of a heavy-tailed
# distribution / how quickly the posterior distribution over the tail parameter contracts
# when
