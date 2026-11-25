open Graph
open Tools


(*trouve min d'un chemin*)
let rec min_on_path = function
  | [] -> max_int
  | {src = _;tgt = _;lbl = x}::rest -> min x (min_on_path rest)

(*creer un chemin avec un coup constant mini*)
let rec path_mini x = function
  | [] -> []
  | a::rest -> {a with lbl = x}::(path_mini x rest)
  

(* modifier le graphe double fleche en fonction du chemin et du coup trouver*)
let rec modife_graphe g = function 
  | [] -> g
  | {src = x;tgt = y;lbl = z}::rest -> modife_graphe (add_arc (add_arc g y x (z)) x y (-z)) rest

