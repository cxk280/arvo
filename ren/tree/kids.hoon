::
::::  /hoon/kids/tree/ren
  ::
/?  310
/-  tree-include
/=  gas  /$  fuel:html
/=  kids  /^  (map @ta tree-include)
          /_  /%  /tree-combine/
::
|=  $=  opts  %-  list
  $?  %date
      %author
      %title
      [%layout ?(%list %grid)]
      [%show ?(%preview %full %full-no-link)]
      [%count @u]
      [%sort ?(%date %default %bump)]
      %reverse
      [%class @t]
      [%id @t]
      [%datapath @t]
  ==
=/  has-opt   ~(has in (sy opts))
=/  named-opt  %-  malt
  %+  turn  (skim opts |=(a=* .?(a)))
  |=  a=*
  ?>  ?=([@ *] a)
  [`@tas`-.a +.a]

=/  layout-opt
  ?.  (~(has by named-opt) %layout)
    %list
  (~(got by named-opt) %layout)
=/  class-val
  ?:  (~(has by named-opt) %class)
    (~(got by named-opt) %class)
  ?:  =(%grid layout-opt)  
    'kids'
  'list'
?>  ?=(@t class-val)
=/  id-val
  ?:  (~(has by named-opt) %id)
    (~(got by named-opt) %id)
  ''
?>  ?=(@t id-val)
=/  layout-element  ?:(=(layout-opt %grid) "col-md-4" "")
=/  sort-opt
  ?.  (~(has by named-opt) %sort)
    %default
  (~(got by named-opt) %sort)
=/  sorted  %+  sort  ~(tap by kids)
  |=  $:  [@ta a=tree-include]
          [@ta b=tree-include]
      ==
  ^-  ?
  =/  has-a  ~(has by meta.a)
  =/  has-b  ~(has by meta.b)
  =/  got-a  ~(got by meta.a)
  =/  got-b  ~(got by meta.b)
  ?:  =(%date sort-opt)
    ?:  &((has-a %date) (has-b %date))
      %+  lte  (slav %da (got-a %date)) 
               (slav %da (got-b %date))
    ~|  %missing-date  !!  
  ?:  &((has-a %sort) (has-b %sort))
    %+  lte  (slav %ud (got-a %sort))
             (slav %ud (got-b %sort))
  ?:  (has-a %sort)
    &
  ?:  (has-b %sort)
    |
  &
::
=?  sorted  (has-opt %reverse)
  (flop sorted)
=/  count
  ?:  (~(has by named-opt) %count)
    (~(got by named-opt) %count)
  (lent sorted)
?>  ?=(@ count)
::
=/  link-to
  ?:  (~(has by named-opt) %datapath)
    (~(got by named-opt) %datapath)
  './'
?>  ?=(@t link-to)
::
^-  manx
;div(class (trip class-val), id (trip id-val))
;*  %+  turn  (scag count sorted)
|=  [name=@ta inc=tree-include]
=/  has-meta  ~(has by meta.inc)
=/  got-meta  ~(got by meta.inc)
::=/  link-to  %+  weld  
::  (spud (slag 1 (flop s.bem.gas)))
::  "/{(trip name)}"
=/  link-to  "{(trip link-to)}{(trip name)}/"
;div(class layout-element)
  ;*  ?:  &((has-opt %date) (has-meta %date))
    ;=  ;div.date: {(trip (got-meta %date))}
    ==
  ~
  ;*  ?:  (has-opt %title)
        ;=  ;h1.title
        ;+  ?:  (has-meta %title)
              ;a(href link-to): {(trip (got-meta %title))}
            ?~  head.inc
              ;a(href link-to): {(trip name)}
            ;a(href link-to): *{head.inc}
        ==
        ==
      ~
  ;*  ?:  (~(has by named-opt) %show)
        =+  x=(~(got by named-opt) %show)
        ?:  =(x %preview)
          snip.inc
        ?:  =(x %full)
          body.inc
        ?:  =(x %full-no-link)
          ;=  +{full.inc}
          ==
        ~
      ~
  ;*  ?:  &((has-opt %author) (has-meta %author))
    ;=  ;div: {(trip (got-meta %author))}
    ==
  ~
  ==
==
