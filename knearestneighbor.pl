    /*
     * In the first step, all the pairwise distances between data points are calculated and saved into a distance matrix.
     * Dm is distance matrix in my code.
     * write(Dm),
     */

    /*
     * Then, distances are sorted for every row.
     * L is sorted list in my code.
     * write(L),
     */

    /*
     * Finally, the first K elements from the sorted list are returned as the K nearest neighbors of a given data point.
     * I am taking first K value with firstKelement function
   	 */

distanceList(X, Y, D) :- 
	dist(X,Y,D1),
	D is sqrt(D1).

dist([],[],0).
dist([H|T], [H2|T2], D) :- 
	dist(T, T2, D1),
	P is (H-H2)*(H-H2), 
 	D is P + D1.

firstKelement(0,_,[]).
firstKelement(N,[H|T1],[H|T2]) :-
    Loopforcut is N-1,
    firstKelement(Loopforcut,T1,T2).

getdatafromdatabase(F,S,_):-
    data(F,Y,_),
    copy_term(Y,S).

neighbors(Selection,K,Neighbors) :-
    getdatafromdatabase(Selection,Instance,_),
    findall(D-C,(data(_,E,C),distanceList(Instance,E,D)),Dm),
    keysort(Dm,L),
    firstKelement(K,L,Neighbors).

%?- neighbors(2,4,L).