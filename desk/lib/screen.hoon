/-  *screen
|%

  ++  update-at
    |=  [state=screen-state =vec val=@u]
    ^-  screen-state
    ~&  vec
    =/  row  (snag y.vec state)
    =/  old-val  (snag x.vec state)
    =/  new-val  ~=(old-val val)
    =/  new-row  ~=(row (snap row x.vec new-val))
    =/  new-state  ~=(state (snap state y.vec new-row))
    new-state


  ++  line
    |=  [a=@u v=@u]
    (turn (gulf 1 a) |=(b=@u v))
  ++  rows
    |=  [x=@u y=@u v=@u]
    (turn (gulf 1 y) |=(b=@u (line x v)))
  ::
  ++  enjs-update
    =,  enjs:format
    |=  upd=update
    ^-  json
    |^
    ?-    -.upd
        %blit
      %-  pairs 
      :~  ['screen-state' a+(turn screen-state.upd screen-state-rows)]
      ==
    ==
    ++  screen-state-rows
      |=  ss=(list @u)
      ^-  json
      [a+(turn ss numb)]
  --
    
--
