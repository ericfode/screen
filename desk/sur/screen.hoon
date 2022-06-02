|%
+$  vec  [x=@u y=@u]
+$  action
  $%  [%blit =screen-state]
      [%blank size=vec]
      [%blip at=vec val=@u]
::      [%watch who=@p]
::      [%see]
::      [%dim who=@p]
:: [%click =pos]
  ==
+$  screen-state  (list (list @))
+$  update  
  $%  [%blit =screen-state]
  ==
--
