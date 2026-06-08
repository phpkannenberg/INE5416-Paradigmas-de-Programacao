/*
Crie uma regra areaTriangulo(B,A,Area) que receba a base e a altura de um triangulo e calcule a area do mesmo.
*/

areaTriangulo(B,A,Area) :- (B >= 0), (A >= 0), Area is (B * A) / 2.
