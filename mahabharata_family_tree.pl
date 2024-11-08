% Facts
male(kuru).
male(shantanu).
male(parashara).
male(bhishma).
male(chitrangada).
male(vichitravirya).
male(vyasa).

male(dhritarashtra).
male(shakuni).
male(pandu).
male(yudishtira).
male(bhima).
male(arjuna).

male(nakula).
male(sahadeva).

male(duryodhana).
male(dushasana).
male(ninetyeightsons).

male(abhimanyu).
male(parikshith).

female(ganga).
female(satyavati).
female(ambika).
female(ambalika).

female(gandhari).
female(kunti).

female(madri).
female(draupadi).
female(subhadra).

female(dussala).
female(shrutakirti).
female(uttara).

% Parent relationships
parent(kuru, shantanu).

parent(shantanu, bhishma).
parent(ganga, bhishma).

parent(shantanu, chitrangada).
parent(satyavati, chitrangada).

parent(shantanu, vichitravirya).
parent(satyavati, vichitravirya).

parent(satyavati, vyasa).
parent(parashara, vyasa).

parent(ambika, dhritarashtra).
parent(vyasa, dhritarashtra).

parent(vyasa, pandu).
parent(ambalika, pandu).

parent(kunti, arjuna).
parent(pandu, arjuna).

parent(kunti, bhima).
parent(pandu, bhima).

parent(kunti, yudishtira).
parent(pandu, yudishtira).

parent(madri, nakula).
parent(pandu, nakula).

parent(madri, sahadeva).
parent(pandu, sahadeva).

parent(dhritarashtra, duryodhana).
parent(gandhari, duryodhana).

parent(dhritarashtra, dussala).
parent(gandhari, dussala).

parent(dhritarashtra, dushasana).
parent(gandhari, dushasana).

parent(dhritarashtra, ninetyeightsons).
parent(gandhari, ninetyeightsons).

parent(draupadi, shrutakirti).
parent(subhadra, abhimanyu).

parent(abhimanyu, parikshith).
parent(uttara, parikshith).

% Marriages
married(shantanu, ganga).
married(shantanu, satyavati).
married(parashara, satyavati).

married(vichitravirya, ambika).
married(vyasa, ambika).
married(vyasa, ambalika).

married(dhritarashtra, gandhari).
married(pandu, kunti).
married(pandu, madri).

married(arjuna, draupadi).
married(arjuna, subhadra).

married(abhimanyu, uttara).

% Pandavas and Kauravas
pandava(yudishtira).
pandava(bhima).
pandava(arjuna).
pandava(nakula).
pandava(sahadeva).

kaurava(duryodhana).
kaurava(dussala).
kaurava(dushasana).
kaurava(ninetyeightsons).

% Relationships
ancestor(X, Y):- parent(X, Y).
ancestor(X, Y):- parent(X, Z), ancestor(Z, Y).

mother(X, Y):- parent(X, Y), female(X).
father(X, Y):- parent(X, Y), male(X).

sibling(X, Y):- father(Z, X), father(Z, Y), mother(W, X), mother(W, Y), X\=Y.

sister(X, Y):- sibling(X, Y), female(X).
brother(X, Y):- sibling(X, Y), male(X).

stepBrother(X, Y):-
    ((father(Z, X), father(Z, Y), mother(W, X), mother(V, Y), W\=V, X\=Y);
    (mother(Z, X), mother(Z, Y), father(W, X), father(V, Y), W\=V, X\=Y)), male(X).

stepSister(X, Y):-
    ((father(Z, X), father(Z, Y), mother(W, X), mother(V, Y), W\=V, X\=Y);
    (mother(Z, X), mother(Z, Y), father(W, X), father(V, Y), W\=V)), female(X).

stepMother(X, Y):-
    father(Z, Y), married(Z, X), female(X), \+ mother(X, Y).

stepFather(X, Y):-
    mother(Z, Y), married(X, Z), male(X), \+ father(X, Y).

grandParent(X, Y):- parent(X, Z), parent(Z, Y).
grandFather(X, Y):- grandParent(X, Y), male(X).
grandMother(X, Y):- grandParent(X, Y), female(X).

maternalUncle(X, Y):- mother(Z, Y), brother(X, Z).
maternalAunt(X, Y):- mother(Z, Y), sister(X, Z).
maternalUncleWife(X, Y):- maternalUncle(Z, Y), married(Z, X), female(X).
maternalAuntHusband(X, Y):- maternalAunt(Z, Y), married(X, Z), male(X).

paternalUncle(X, Y):- father(Z, Y), brother(X, Z).
paternalAunt(X, Y):- father(Z, Y), sister(X, Z).
paternalUncleWife(X, Y):- paternalUncle(Z, Y), married(Z, X), female(X).
paternalAuntHusband(X, Y):- paternalAunt(Z, Y), married(X, Z), male(X).

% Special relationship facts
sister(gandhari, shakuni).
brother(shakuni, gandhari).