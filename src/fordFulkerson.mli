open Graph

(*fonction principale*)
(*val ford_fulkerson: int graph -> int graph*)


(*trouve chemin max dans graphe double fleche / si aucun chemin trouver finir / verifier pas de passage double sur un node / DFS / ignorer arc 0*)
val find_path: int graph -> int arc list


(*trouve min d'un chemin*)
val min_on_path: int arc list -> int

(*creer un chemin avec un coup constant mini*)
val path_mini: int -> int arc list -> int arc list

(* modifier le graphe double fleche en fonction du chemin et du coup trouver*)
val modife_graphe: int graph -> int arc list -> int graph