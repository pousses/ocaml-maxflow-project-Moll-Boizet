open Graph


let clone_nodes (gr:'a graph) = n_fold gr (fun (gra:'b graph) (n:id) -> new_node gra n ) empty_graph

let gmap (gr:'a graph) f = e_fold gr (fun (gra:'b graph) (e:'a arc) -> new_arc gra {src = e.src; tgt = e.tgt; lbl = f (e.lbl)}) (clone_nodes gr)

let add_arc (gr:int graph) (id1:id) (id2:id) n =
  match find_arc gr id1 id2 with
  |None -> new_arc gr {src = id1; tgt = id2; lbl = n}
  |Some e -> new_arc gr {src = id1; tgt = id2; lbl = e.lbl + n}
