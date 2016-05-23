(datatype undefined
   ______________
   ??? : X;)

(datatype a
  _______
  a : a;)

(datatype b
  _______
  b : b;)

(datatype c
  _______
  c : c;)

(datatype d
  _______
  d : d;)

(datatype e
  _______
  e : e;)

(datatype f
  _______
  f : f;)

(datatype g
  _______
  g : g;)

(datatype h
  _______
  h : h;)

(define a-b-c
  { a --> b --> c }
  _ _ -> ??? )

(define b-c-d
  { b --> c --> d }
  _ _ -> ??? )

(define c-d
  { c --> d }
  _ -> ??? )

(define a-e
  { a --> e }
  _ -> ??? )

(define b-f
  { b --> f}
  _ -> ???)