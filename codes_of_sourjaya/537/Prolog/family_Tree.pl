%MALES
male(john).
male(brian).
male(henry).
male(anthony).
male(bob).
male(peter).
male(dennis).
male(charles).
male(ivan).
male(george).
male(kevin).
male(arthur).
male(fred).
male(jason).
%FEMALES
female(mary).
female(alice).
female(annie).
female(clara).
female(shelly).
female(ira).
female(mia).
female(jenny).
female(tia).
female(laura).
%FATHER
father(john,alice).
father(john,henry).
father(john,clara).
father(john,bob).
father(brian,peter).
father(brian,dennis).
father(peter,arthur).
father(peter,jenny).
father(henry,ira).
father(henry,ivan).
father(charles,tia).
father(charles,laura).
father(george,fred).
father(george,jason).
father(bob,mia).
father(bob,kevin).
father(anthony,mia).
father(anthony,kevin).
%MOTHER
mother(mary,alice).
mother(mary,henry).
mother(mary,clara).
mother(mary,bob).
mother(alice,peter).
mother(alice,dennis).
mother(shelly,arthur).
mother(shelly,jenny).
mother(annie,ira).
mother(annie,ivan).
mother(ira,tia).
mother(ira,laura).
mother(mia,fred).
mother(mia,jason).

%GRANDFATHER
grandfather(X,Y):-father(X,Z),father(Z,Y).
grandfather(X,Y):-father(X,Z),mother(Z,Y).
%GRANDMOTHER
grandmother(X,Y):-mother(X,Z),father(Z,Y).
grandmother(X,Y):-mother(X,Z),mother(Z,Y).
%PARENT
parentof(X,Y):-father(X,Y);mother(X,Y).
isparent(X):-parentof(X,_).
%SIBLINGS
sibling(X,Y):-parentof(Z,X),parentof(Z,Y),X\=Y.
%COUSINS
cousin(X,Y):-grandfather(Z,X),grandfather(Z,Y),X\=Y.
cousin(X,Y):-grandmother(Z,X),grandmother(Z,Y),X\=Y.
%BROTHER
brother(X,Y):-male(X),sibling(X,Y),cousin(X,Y).
%CHILD
child(X,Y):-father(Y,X).
child(X,Y):-mother(Y,X).
%PREDECESSOR
predecessor(X,Y):-parentof(X,Y).
predecessor(X,Y):-predecessor(X,Z),parentof(Z,Y).
%PREDECESSOR
successor(X,Y):-child(X,Y).
successor(X,Y):-successor(X,Z),child(Z,Y).