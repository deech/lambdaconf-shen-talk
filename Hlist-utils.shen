(define separate
  [] -> []
  [X] -> [end X]
  [X | XS] -> [X , | (separate XS)]
  )


(define index
  Index [] -> []
  Index [X] -> [end Index X]
  Index [X | XS] -> [Index X , | (index (+ Index 1) XS)])
