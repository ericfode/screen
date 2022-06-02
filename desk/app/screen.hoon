/-  *screen
/+  *screen
/+  default-agent, dbug, agentio
|%
+$  versioned-state
  $%   =state-0
  ==
+$  state-0  [%0 =screen-state]
+$  card  card:agent:gall
::
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    io    ~(. agentio bowl)
::
++  on-init  :: on-init:def
  ^-  (quip card _this)
  `this(screen-state ~[~[1]])
++  on-save   
  ^-  vase
  !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(versioned-state old))
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  ?.  ?=(%screen-action mark)  (on-poke:def mark vase)  :: fall out if action wrong
  =/  act  !<(action vase)
  =.  state  (poke-action act)
  :_  this
  ~[(fact:io screen-update+!>(`update`[%blit screen-state.this]) ~[/updates])]
  ++  poke-action
    |=  act=action
    ^-  _state
    ?-    -.act
        %blip
      state(screen-state (update-at screen-state.this at.act val.act))
        %blit
      state(screen-state screen-state.act)
        %blank
      state(screen-state (rows x.size.act y.size.act 0))
    ==
  --::  |^
++  on-watch :: on-watch:def
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
    [%updates ~]  `this
  ==
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  [~ ~]
      [%x %screen ~]
    :^  ~  ~  %screen-update
    !>  ^-  update 
    [%blit screen-state.this]
  ==
++  on-leave  on-leave:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def

--
