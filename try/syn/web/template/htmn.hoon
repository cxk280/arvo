!:
::  Some uses of template syntax
::
%-  give
|=  epic
^-  manx
=+  lim=;li:"second ;{a/funky."http://www.urbit.org" "link"} item"
=+  lum=;li:"third [owner: {(scow %p own)}] item"
=+  lom=;li:"fourth (;{i "italics"}) item"
=+  bar=;br;
=+  foo=`manx`i/;"foobar"
=+  lam=`(list manx)`[lim lum lom ~]
;html
  ;head
    ;title: Urbi et Burbi
  ==
  ;body
    ;p: Hello, world.
    ;p:"Hello"
    ;-  "Goodbye"
    ;+  ;p:"Hello again"
    ;*  ~[;p:"One" ;p:"Two" ;p:"Three"]
    ;br;
    ;p: Behold a <p>aragraph with an embedded {"string"}.
    ;p: Or an embedded ;{i "tag"}.
    ;p: Or even a *{;i:"list" ;i:" of" ;i:" tags" ~},
    ;p: Sometimes %{|*(a=* [;i:"functionally " ;i:"applied" a])}.
    ;p: It's nice to just be able to use "quotes."
    ;p
      ; We are also very good at lists:
      ;ul
        ;li: first item
        ;*  lam
        ;li: last item
      ==
    ==
  ==
==
