(datatype hlist
  let Separated (shen.cons_form (separate (shen.decons Xs)))
  Separated : HList;
  _____________________________
  [hlist | Xs] : (hlist HList);

  X : Type;
  XS : Types;
  ______________________
  [X , | XS] : (Type Types);

  X : Type;
  ______________________
  [end X | []] : (Type hnil);
)

(datatype indexed-hlist
  let Separated (shen.cons_form (index 0 (shen.decons Xs)))
  Separated : HList;
  _____________________________
  [indexed-hlist | Xs] : (indexed-hlist HList);

  X : Type;
  XS : Types;
  ______________________
  [Index X , | XS] : (Index Type Types);

  X : Type;
  ______________________
  [end Index X | []] : (Index Type hnil);


  H1 : (hlist X1);
  H2 : (hlist X2);
  ________________________________
  (hlist-append H1 H2) : (hlist X1);
)
