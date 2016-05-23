(define with-value
  Key _       []                     F -> (error (make-string "Key ~A not found" Key))
  Key LeftKVs [(@p Key Value) | KVs] F -> (F LeftKVs Value KVs)
  Key LeftKVs [KV | KVs]             F -> (with-value Key (append LeftKVs [KV]) KVs F))

(define get-key
  Key KVs -> (with-value Key [] KVs (/. _ Value _ Value)))

(define set-key
  Key KVs Value ->
     (with-value Key [] KVs
       (/. LeftKVs _ KVs
           [object (append LeftKVs (append [(@p Key Value)] KVs))])))

(define object-lens
  Key [object | KVs] ->
    (@p (get-key Key KVs)
        (set-key Key KVs)))

(define set-index
  Index Array Value -> (set-index-helper Index [] Array Value))

(define set-index-helper
  0     Left [_ | Rs] Value -> (append (append Left [Value]) Rs)
  Index Left [R | Rs] Value ->
    (set-index-helper (- Index 1) (append Left [R]) Rs Value))

(define get-index
  0 [X | _] -> X
  N [_ | Y] -> (get-index (- N 1) Y))

(define array-lens
  Index Array ->
    (@p (get-index Index Array)
        (set-index Index Array)))

(define starter-lens
  X -> (@p X (/. V V)))

(define modify
   LensF Json G ->
   (let Lens (LensF Json)
        ((snd Lens) (G (fst Lens)))))

(define access
   LensF Json -> (fst (LensF Json)))

(define compose
   Lens1F Lens2F Json ->
     (let Lens1 (Lens1F Json)
          Lens2 (Lens2F (fst Lens1))
          (@p (fst Lens2) (/. V ((snd Lens1) ((snd Lens2) V))))))

(define fold-lenses-helper
   AccumLens [] -> AccumLens
   AccumLens [Lens | Lenses] ->
     (fold-lenses-helper (compose AccumLens Lens)
                         Lenses))
(define fold-lenses
   [] -> starter-lens
   [Lens | Lenses] ->
      (fold-lenses-helper
         (compose starter-lens Lens)
         Lenses))

(define get-action
   set -> (function modify)
   get -> (function access))

(define from-json
  Path JsonString ->
    ((compile <action> Path)
       (compile <object>
          (compile <uncons> (read-from-string JsonString)))))