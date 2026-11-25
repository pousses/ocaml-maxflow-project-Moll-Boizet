open Graph
open Tools

(*trouve un chemin entre la source et le puit*)
let find_path g id_s id_p =

  let rec path_finding g arcs id_p =
    match arcs with
    | [] -> None
    | x :: _ when x.tgt = id_p -> Some (x :: [])
    | x :: rest ->
      match (path_finding g (out_arcs g x.tgt) id_p) with
      | None -> (path_finding g rest id_p)
      | Some y -> Some (x :: y)
  in

  path_finding g (out_arcs g id_s) id_p
;;


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

