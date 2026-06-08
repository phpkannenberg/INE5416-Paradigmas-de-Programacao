/*
Crie uma regra aprovado(A,B,C) que receba tres notas de uma aluno (A,B,C), calcule a media e indique se o aluno foi aprovado ou reprovado. Para um aluno ser aprovado, ele deve possuir nota igual ou superior a 6.
*/

aprovado(A,B,C) :- (A + B + C) / 3 >= 6.
