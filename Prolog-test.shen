(defprolog mem
   X [X | _] [FOUND | _] <--;
   X [_ | Y] [X | Y]    <-- (mem X Y);)