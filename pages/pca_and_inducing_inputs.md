@def title = "PCA and Inducing Inputs"

# PCA Recap and Abstraction

We'll take a more abstract approach to the introduction of PCA than usual -- this is
necessary as we will need to find a way to apply PCA to Hilbert spaces, not just Euclidean
space.

Let $\mathcal{X} := (\mathcal{X}, \innerprod{\cdot}{\cdot}{\H})$ be a real Hilbert space, with the usual induced norm $\| x \|_\H :=  \sqrt{\innerprod{x}{x}{\H}}$ and distance $d_\H(x, y) := \| x - y \|_\H$.
Let $x_1, ..., x_N \in \mathcal{X}$ be our data set.
The aim of PCA is to find the $M$-dimensional subspace $\mathcal{X}_M$ of $\mathcal{X}$ which minimises
\begin{equation*}
    f(x_{1:N}, \mathcal{X}_M) = \sum_{n=1}^N d_M(x_n)^2,
\end{equation*}
where $d_M(x_n)$ is the distance from the point $x_n$ to the subspace $\mathcal{X}_M$ and $M$ is finite, and
to find an approximation to each point $x_n$ which lies in this subspace.

Since $M$ is finite, $\mathcal{X}_M$ will have an orthogonal basis $w_1, ..., w_M \in \mathcal{X}$, a little calculus shows that the distance from any $x_n$ to $\mathcal{X}_M$ can be written in terms of the projection of $x_n$ onto this basis:
\begin{equation*}
    f(x_{1:N}, \mathcal{X}_M) = \sum_{n=1}^N \| x_n - \sum_{m=1}^M \innerprod{x_n}{w_m}{\H} \,\, w_m \|_\H^2
\end{equation*}
where $\| w_m \|_\H = 1$ and $\innerprod{w_m}{w_p}{\H} = \mathbf{1}_{m = p}$.
Expanding the above in terms of the inner product yields
\begin{equation*}
    f(x_{1:N}, \mathcal{X}_M) = \sum_{n=1}^N \innerprod{x_n}{x_n}{\H} - \sum_{n=1}^N \sum_{m=1}^M \innerprod{w_m}{x_n}{\H} \innerprod{x_n}{w_m}{\H}.
\end{equation*}
(We've utilised the fact that we constrained $w_1, ..., w_M$ to form an orthogonal basis to simplify this a bit).
Since the first term is constant in $\mathcal{X}_M$, minimising $f$ is equivalent to maximising
\begin{equation*}
    g(x_{1:N}, w_{1:M}) := \sum_{n=1}^N \sum_{m=1}^M \innerprod{w_m}{x_n}{\H} \innerprod{x_n}{w_m}{\H}.
\end{equation*}

Note that we have not placed any constraints on the dimension of $\mathcal{X}$, just $\mathcal{X_M}$.
We must, therefore, either impose some constraints on $w_m$, or restrict the dimension of $\mathcal{X}$, in order to produce an algorithm which can be implemented.


## The Data-Subspace Trick

The key observation underlying kernel PCA [insert reference] is that the best choice of $w_1, ..., w_M$ must lie in $\textrm{span}(x_1, ..., x_N)$, which is a subspace of at most dimension $N$.
We therefore parametrise each $w_m$ via a collection of coefficients $\alpha_{m1}, ..., \alpha_{mN} \in \reals$:
\begin{equation*}
    w_m := \sum_{n=1}^N \alpha_{mn} x_n.
\end{equation*}

**Key** **point**: This parametrisation is useful provided that we have the ability to evaluate $\innerprod{x_p}{x_q}{\H}$, as in the situation we're interested in here, when the kernel defines the inner product.
This is because we can express the inner product between any $w_m$ and $x_n$ as
\begin{equation*}
    \innerprod{w_m}{x_n}{\H} = \innerprod{\sum_{i=1}^N \alpha_{m i} x_i}{x_n}{\H} = \sum_{i=1}^N \alpha_{m i} \innerprod{x_i}{x_n}{\H},
\end{equation*}
Let $\v{a}_m \in \reals^N$ be the vector comprising $\alpha_{m1}, ..., \alpha_{mN}$, then plugging the above into $g$ yields
\begin{equation*}
    g(x_{1:N}, \v{a}_{1:M}) = \sum_{m=1}^M \v{a}_m \K^2 \v{a}_m, \quad \K_{ij} := \innerprod{x_i}{x_j}{\H}.
\end{equation*}



and any pair of basis vectors in a similar fashion:
\begin{equation*}
    \innerprod{w_p}{w_q}{\H} = \innerprod{\sum_{i=1}^N \alpha_{p i} x_i}{\sum_{j=1}^N \alpha_{qj} x_j}{\H} = \sum_{i=1}^N \sum_{j=1}^N \alpha_{p i} \alpha_{q j} \innerprod{x_i}{x_j}{\H}.
\end{equation*}
Plugging 




## Aside: when $\mathcal{X}$ is Finite Dimensional

This is the usual scenario in which PCA is encountered.
I leave it as an exercise for the reader to the recover the usual "compute the eigenvalues / eigenvectors of the empirical covariance matrix" solution from the solution in the previous section.