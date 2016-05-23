(defcc shen.<strc>
  Escaped Byte := (n->string Byte) where (= Escaped 92);
  Byte := (n->string Byte) where (not (= Byte 34));)

(defcc <action>
   set <chain-lenses> := ((function modify) (fold-lenses <chain-lenses>));
   get <chain-lenses> := ((function access) (fold-lenses <chain-lenses>));)

(defcc <chain-lenses>
   <lens> <chain-lenses> := [<lens> | <chain-lenses>];
   <lens>                := [<lens>];)

(defcc <lens>
   X := (array-lens X) where (number? X);
   X := (object-lens X) where (symbol? X);)

(defcc <object>
  { <members> } := [object | <members> ];
  {}            := [object];
  { }           := [object];)

(defcc <members>
  <pair> , <members> := [<pair> | <members>];
  <pair>             := [<pair>];)

(defcc <pair>
  String : <value> := (@p (intern String) <value>);)

(defcc <array>
  [ <elements> ] := <elements>;
  []             := [];
  [ ]            := [];)

(defcc <elements>
  <value> , <elements> := [<value> | <elements>];
  <value> := [<value>])

(defcc <uncons>
  [cons X Xs] <uncons> := [(eval [cons X Xs]) | <uncons> ] ;
  X <uncons> := [X | <uncons> ];
  X := [X])

(defcc <value>
  <object> := <object>;
  <array>  := <array>;
  X        := X;)