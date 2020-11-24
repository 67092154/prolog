hombre(gualberto).
hombre(filomon).
hombre(alfredo).
hombre(jhimmer).
hombre(hugo).
hombre(alex).
hombre(silverio).
hombre(cristian).
hombre(ricardo).
hombre(omar).
hombre(alvaro).
hombre(luan).
hombre(eloy).
hombre(benito).
hombre(marino).
hombre(juan).
hombre(alejo).
hombre(joel).
hombre(edison).
hombre(german).

mujer(senovia).
mujer(julia).
mujer(panfi).
mujer(lucy).
mujer(gladis).
mujer(josefa).
mujer(doris).
mujer(monica).
mujer(pamela).
mujer(clara).
mujer(martha).
mujer(yesenia).
mujer(caterin).
mujer(anahi).
mujer(ester).
mujer(rosa).
mujer(yhocelin).
mujer(alison).
mujer(sonia).
mujer(dayana).
mujer(encarna).
mujer(jualia).

padre(gualberto,filomon).
padre(gualberto,hugo).
padre(gualberto,silverio).
padre(gualberto,martha).
padre(gualberto,ricardo).
padre(gualberto,rosa).
padre(gualberto,sonia).

padre(filomon,alfredo).
padre(filomon,jhimmer).
padre(filomon,doris).

padre(hugo,monica).
padre(hugo,pamela).
padre(hugo,clara).
padre(hugo,alex).

padre(silverio,yesenia).
padre(silverio,cristian).
padre(silverio,caterin).
padre(silverio,anahi).
padre(silverio,ester).

padre(ricardo, omar).
padre(ricardo, alvaro).
padre(ricardo, edizon).

padre(juan,david).

padre(alejo,yhocelin).
padre(alejo,alison).

padre(joel,dayana).
padre(joel,luan).

padre(german,benito).
padre(german,marino).
padre(german,noelia).

padre(eloy,panfi).
padre(eloy,encarna).


madre(senovia,filomon).
madre(senovia,hugo).
madre(senovia,silverio).
madre(senovia,martha).
madre(senovia,ricardo).
madre(senovia,rosa).
madre(senovia,sonia).

madre(panfi,alfredo).
madre(panfi,jhimmer).
madre(panfi,doris).

madre(lucy,monica).
madre(lucy,pamela).
madre(lucy,clara).
madre(lucy,alex).

madre(gladis,yesenia).
madre(gladis,cristian).
madre(gladis,caterin).
madre(gladis,anahi).
madre(gladis,ester).

madre(josefa, omar).
madre(josefa, alvaro).
madre(josefa, edizon).

madre(rosa,yhocelin).
madre(rosa,alison).

madre(martha,david).

madre(sonia,dayana).
madre(sonia,luan).

madre(encarna,benito).
madre(encarna,marino).
madre(encarna,noelia).

madre(julia,panfi).
madre(julia,encarna).


%REGLAS
diferente(X,Y):-not(X=Y).
%abuelo(X,Y): Xes abuelo dde Y.
abuelode(X,Y):-padre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%abuela
abuelade(X,Y):-madre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%hijo(x,y):x es hijo de y
hijode(X,Y):-hombre(X),(padre(Y,X);madre(Y,X)).

%hija(x,y):x es hija de y
hijade(X,Y):-mujer(X),(padre(Y,X);madre(Y,X)).

%tio(X,Y):x es tio de y
tiode(X,Y):-hombre(X),((padre(P,Y),hermano(X,P);madre(M,Y),hermano(X,M));(padre(X,M2),madre(AU,M2),(hermana(AU,M1),madre(M1,Y);hermana(AU,P1),padre(P1,Y)))).
%tio(X,Y):-varon(X),(sobrina(Y,X);sobrino(Y,X)).

%tia
tiade(X,Y):-mujer(X),((padre(P,Y),hermana(X,P);madre(M,Y),hermana(X,M));(madre(X,M2),padre(AU,M2),(hermano(AU,M1),madre(M1,Y);hermano(AU,P1),padre(P1,Y)))).
%primo(X,Y): X Es primo de Y
primo(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),hombreX),diferente(X,Y).
%prima(X,Y): X Es prima de Y
prima(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),mujer(X),diferente(X,Y).

%sobrino(X,Y) : X ES SOBRINO DE Y
sobrinode(X,Y):-hijo(X,P),(hermano(P,Y);hermana(P,Y)).

%sobrina (X,Y): X ES SOBRINA DE Y
% sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)),((madre(Y,HA),mujer(Y),padre(Z1,HA));(varon(Y),padre(Y,HB),madre(Z2,HB))).
sobrinade(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)).

%hermano(x,y): x es hermano de y
hermanode(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),hombre(X).

%hermana
hermanade(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),mujer(X).

%padrastro: X ES PADRASTRO DE Y
padrastro(X,Y):-not(hijo(Y,X);hija(Y,X)),padre(X,H),(madre(M,Y),madre(M,H)),hombre(X),!.

%madrastra
madrastra(X,Y):-not(hijo(Y,X);hija(Y,X)),madre(X,H),(padre(P,Y),padre(P,H)),mujer(X),!.



%hermanastro(x,y):x es hermanastro de y
hermanastro(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),hombreX).

%hermanastra
hermanastra(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),mujer(X).

nietode(X,Y):-(abuelode(Y,X);abuelade(Y,X)),hombre(X).
nietade(X,Y):-(abuelade(Y,X);abuelode(Y,X)),mujer(X).

