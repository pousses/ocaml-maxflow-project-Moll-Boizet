open Gfile
open FordFulkerson
open Tools
    
let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)
  
  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in


  let b = modife_graphe (gmap graph int_of_string) (path_mini (min_on_path ({src = 0;tgt = 1;lbl = 3}::{src = 1;tgt = 5;lbl = 1}::{src = 1;tgt = 4;lbl = 15}::[])) ({src = 0;tgt = 1;lbl = 3}::{src = 1;tgt = 5;lbl = 2}::{src = 1;tgt = 4;lbl = 15}::[])) in


  (* Rewrite the graph that has been read. *)
  let () = export outfile graph in

  let () = export outfile (gmap b string_of_int) in


  ()


