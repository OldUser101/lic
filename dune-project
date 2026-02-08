(lang dune 3.20)
(name lic)

(license LICENSE)

(generate_opam_files true)
(opam_file_location inside_opam_directory)

(formatting 
 (enabled_for dune))

(package
 (name lic)
 (depends
  (ocaml (>= 4.08)) 
  (ppx_blob (>= 0.9.0))
 ))
