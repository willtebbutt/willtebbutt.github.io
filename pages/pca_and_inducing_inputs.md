@def title = "PCA and Inducing Inputs"

# PCA Recap and Abstraction

We'll take a more abstract approach to the introduction of PCA than usual -- this is
necessary as we will need to find a way to apply PCA to Hilbert spaces, not just Euclidean
space.

Let $\mathcal{X} := (\mathcal{X}, \innerprod{\cdot}{\cdot}{\H})$ be a Hilbert space, with the usual induced norm $\| x \|_\H :=  \sqrt{\innerprod{x}{x}{\H}}$ and distance $d_\H(x, y) := \| x - y \|_\H$.
Let $x_1, ..., x_N \in \mathcal{X}$ be our data set.
The aim of PCA is to find the $M$-dimensional subspace $\mathcal{X}_M$ of $\mathcal{X}$ which minimises
\begin{equation*}
    f(x_{1:N}, \mathcal{X}_M) = \sum_{n=1}^N d_M(x_n)^2,
\end{equation*}
where $d_M(x_n)$ is the distance from the point $x_n$ to the subspace $\mathcal{X}_M$, and
to find an approximation to each point $x_n$ which lies in this subspace.

A small amount of calculus yields
\begin{equation}

\end{equation}
