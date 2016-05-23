(datatype <<HOLE>>

   if (do (output (make-string "<<HOLE>> : ~A~%" X)) true)
   ______________
   <<HOLE>> : X;)

(define dump
  Shen ->
    (let Defs (mapcan (function def) (read-file Shen))
         Types (map get-sig Defs)
      Types))

(define def
  [define F | _] -> [F]
  _ -> [])

(define get-sig
  Def -> [Def (shen.typecheck Def (protect A))])