# Image Reconstruction Using Genetic Algorithm

- The purpose of this project is to reconstruct a simple picture of several polygons. The program starts by generating 'numOfPolygons' polygons of random colors ( left upper corner in the figure) and assumes it to be the original picture that will be reconstructed. 

- After that, the original layout of the polygons in the picture is reconstructed by moving them around. The movement of the polygons in the picture is implemented by using Genetic Algorithm to minimize the RMSE between the original picture and the current picture. 

- In the upper right corner you see the current try, in the buttom left corner you see the currently best positioning (solution ) of the polygons and in the left buttom corner of the figure window you will see the best and average score of the populations of the current generation (it's basically 'gaplotbestf' function).

To use, type in the 'Command Window' - 

imageBuilding(numOfPolygons, numOfGenerations)

Example - >> imageBuilding(20,300)
