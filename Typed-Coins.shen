(datatype coin
  ___________
  penny : coin;
  ___________
  nickel: coin;
  ___________
  dime : coin;
  ___________
  quarter: coin;

  ____________________
  *store*: (list coin);

  X : A;
  ______________
  (value X): A;

  Y : A;
  _____________
  (set X Y) : A;)

(define insert-coin
  { coin --> (list coin) }
  Coin -> (set *store* (append (value *store*) [Coin])))