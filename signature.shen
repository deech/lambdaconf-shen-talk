(define signature
  F -> (prolog? (receive F) (shen.t* [F : A] []) (return [F A])))

(define signatures
  F -> (prolog? (receive F) (findall A [look [F A]] B) (return [F B])))

(defprolog look
  [F A] <-- (shen.t* [F : A] []);)

(define dump
  Shen -> (let Defs (mapcan (function def) (read-file Shen))
               KL (map (function ps) Defs)
               Types (map (function signature) Defs)
            Types))

(define def
  [define F | _] -> [F]
  _ -> [])

(defcc <normalize-sigs>
  X --> [ <normalize-sigs> ] := [X --> | <normalize-sigs>];
  X --> Y                    := [X --> Y];
  X                          := [X];)

(define compiles?
  Grammar [F Sig] -> (not (= (compile Grammar Sig (/. _ false)) false)))

(define find-signature
  Signature Signatures ->
     (let SigParserName (gensym (protect Parser))
          SigParserAST (append
                          [defcc SigParserName]
                            Signature [:= true;]
                            [_ := false;])
          _ (eval SigParserAST)
        (shen.collect (compiles? SigParserName)
                      (map (/. S [(nth 1 S) (compile <normalize-sigs> (nth 2 S))])
                           Signatures))))