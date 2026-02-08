open Lic

let () =
  let output =
    Generate.render_template
      ~vars:[ ("year", "2026"); ("owner", "Test") ]
      Template.bsd2
  in
  print_string output
