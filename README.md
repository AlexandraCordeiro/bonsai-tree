# generative-bonsai-tree
My first Processing sketch!
A generative bonsai tree using Processing

<center>
    <img src="./imgs/img.svg">
    
</center>

## Motivation
The idea came about as a way of exploring this tool, as well as generative design.

## How it works

  Both the pot and the bonsai trunk are static.
The trunk is defined by the curves of 2 parabolas.


____
The branches are drawn according to a recursive function.
Essentially, a branch is subdivided into several segments. Each segment is defined by the curve of the function:

    
        y = branchDirection * branchInclination * sqrt(x)

The **branchDirection** and **branchInclination** variables take random values in each branch segment.
The number of segments in a branch symbolizes the depth of the recursion.
Each branch can create new sub-branches with lower depths than the main branch.
___

The leaves (represented as circles) are drawn vertically, according to a reference point on a branch.
The idea is to draw circles above and below this reference point. The number of circles drawn is random, creating diversity in the density of the leaves.
____
The colors are chosen according to previously defined color palettes that allude to the different seasons.








## Inspiration

- [cbonsai](https://gitlab.com/jallbrit/cbonsai)
- [LEGO bonsai tree](https://www.lego.com/pt-pt/product/bonsai-tree-10281)
