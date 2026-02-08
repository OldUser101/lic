let render_template ~vars tmpl =
  let re key = Str.regexp ("{{ *" ^ key ^ " *}}") in
  List.fold_left
    (fun acc (key, value) -> Str.global_replace (re key) value acc)
    tmpl vars

