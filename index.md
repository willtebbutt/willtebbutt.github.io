@def title = "About"

# About

I'm a PhD student in the [Machine Learning Group](http://mlg.eng.cam.ac.uk/) at Cambridge, supervised by [Rich Turner](http://learning.eng.cam.ac.uk/Public/Turner/WebHome).
I'm generally interested in probabilistic modelling and (approximate) inference, how Gaussian processes should feature in probabilistic programming, and how to scale GPs for large time series and spatio-temporal problems.

The above feeds directly into my work on probabilistic machine learning in climate science, which addresses combining the predictions of ensembles of GCMs in a sensible way, and the requirements that this task places on statistical weather modelling.


# Research Highlights

## Combining Pseudo-Point and State Space Approximations for Sum-Separable Gaussian Processes

[This work](https://arxiv.org/abs/2106.10210) shows how to combine pseudo-point (a.k.a sparse, inducing point, etc) and state space approximations for GPs -- this is a good idea because they have complementary strengths and weaknesses, and combining them yields the benefits of both approximations.
In this work we showed that combining them is remarkably simple, and provide straightforward-to-implement methods for approximate learning and inference.
It's not a priori obvious how to do this in a principled way -- and our main contribution is showing that, due to a little-known existing result, the "right" way to do this is the "obvious" one.
We specifically show how to do this using the widely-favoured variational pseudo-point approximation, but our result generalises to other flavours of pseudo-point approximation.
In particular, our work shines a new light on older work that constructed a very similar approximation using FITC.
Appeared at UAI 2021.

Julia implementation of the technique available in [TemporalGPs.jl](https://github.com/willtebbutt/TemporalGPs.jl/) (see examples).
Code to reproduce experiments available [here](https://github.com/willtebbutt/PseudoPointStateSpace-UAI-2021).

## Gaussian Process Probabilistic Programming

Gaussian process probabilistic programming (GPPP) is a term I've coined for the work I'm doing to re-design the way that we work with GPs in a practical sense.
I presented the high-level aspects of this work at [ProbProg](resources/gppp_probprog.pdf) and [JuliaCon](resources/gppp_juliacon.pdf), and continue to work on a paper.

Implementations available in [Julia](https://github.com/willtebbutt/Stheno.jl) and [Python](https://github.com/wesselb/stheno).

## GPAR
[GPAR](https://proceedings.mlr.press/v89/requeima19a.html) is a multi-output Gaussian process-based regression model.
It's simple, scalable by GP standards, and seems to work really well in practice.
In particular it overcomes some of the limitations of standard multi-output GPs.
It appeared at AISTATS 2019.

Implementations available in [Python](https://github.com/wesselb/gpar) and [Julia](https://github.com/willtebbutt/GPARs.jl/).

## The OILMM
The [OILMM](http://proceedings.mlr.press/v119/bruinsma20a.html) is another multi-output Gaussian process model for regression that's easily able to handle a lot of outputs while retaining exact inference. 
It's really Wessel's thing -- he came up with the main idea, and he and Eric did most of the work.
I pointed out the connection with separable spatio-temporal processes and state space approximations, some ideas for experiments, and used [TemporalGPs.jl](https://github.com/willtebbutt/TemporalGPs.jl/) to run one of the experiments.
It appeared at ICML 2020.

Implementations available in [Python](https://github.com/wesselb/oilmm) and [Julia](https://github.com/willtebbutt/OILMMs.jl).


# Software

## [Stheno.jl](https://github.com/willtebbutt/Stheno.jl)

This is a Julia implementation of my GPPP work.
It's permanently ongoing, but makes working with GPs in problems involving multiple related processes signficantly more straightforward than traditional GP packages.

JuliaCon 2019: [talk](https://www.youtube.com/watch?v=OO3BBkGEMV8) and [slides](resources/stheno_juliacon_2019.pdf).

## [TemporalGPs.jl](https://github.com/willtebbutt/TemporalGPs.jl/)

This work implements SDE approximations to GPs, which dramatically accelerates inference and learning for models involving long time horizons. This is notable because the standard pseudo-point approximations fail in these scenarios.

JuliaCon 2020: [talk](https://www.youtube.com/watch?v=dysmEpX1QoE) and [slides](resources/juliacon-2020.pdf).
