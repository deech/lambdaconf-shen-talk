(set *coins* [])
(set *store* [])
(set *current-datatype* [])
(define create-datatype
  Coins ->
    (append
      [datatype coin]
      (mapcan (/. Coin [
                      ___________
                      Coin : coin;
                    ])
           Coins)))

(define to-coin
  make Coin    -> (append (value *coins*) [Coin])
  remove Coin -> (remove Coin (value *coins*)))

(define with-store
  [Action Coin] ->
    (let NewCoins (to-coin Action Coin)
      (if (not (empty? NewCoins))
          (do
            (set *coins* NewCoins)
            (set *current-datatype* (create-datatype NewCoins))
            (eval (value *current-datatype*)))))
  Coin ->
    (if (= (shen.typecheck Coin coin) coin)
       (set *store* (append (value *store*) [Coin]))
     (make-string "~A is not a coin." Coin)))
