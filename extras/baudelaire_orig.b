/**
 * A visual poem generator inspired by visual poem "Baudelaire" by Jiří Kolář.
 */

/* příprava ASCII kódů pro výpis textu */

>>>>> > +++++ +++++
[
  < +++++ +++++ +
  < +++++ +++++
  < +++++ ++
  < ++++
  < +++
  < +
  >>>>> > -
]

/* výpis instruktážního textu */

<<< - .             //69    E
>> .                //110   n
+++++ + .           //116   t
< + .               //101   e
> -- .              //114   r
<<<< ++ .           //32
>>> ---- .          //97    a
<<< .               //32
>>>> +++++ .        //119   w
----- --- .         //111   o
+++ .               //114   r
< +++ .             //100   d
<<< .               //32
>>> --- .           //97    a
> ---- .            //110   n
< +++ .             //100   d
<<< .               //32
>>>> ++ .           //112   p
++ .                //114   r
< + .               //101   e
> + .               //115   s
.                   //115   s
<<<< .              //32
>> .                //69    E
>> ----- .          //110   n
+++++ + .           //116   t
< .                 //101   e
> -- .              //114   r
<< ----- ----- - .  //58    :
<<< .               //10    \n

/* načtení řetězce */

>>>>> >>>>> >>>>> + //příprava záchytného bodu (CH)

> ----- -----
[
  +++++ +++++       //znaky se zapisují do každé druhé buňky
  >> ,              //počínaje od osmnácté
  ----- -----       //vstup se ukončí při stisknutí Enteru (ASCII kód 10)
]

/* zjišťování počtu zadaných znaků */

<<< -               //přesun na indexovou buňku před posledním zadaným znakem
[                   //postupuje se po indexových buňkách dokud se nenarazí na
  ++                //jedničku v záchytném bodu (CH); do každé prošlé indexové
  >>                //buňky se uloží jednička ke které se následně přičte
  [- << + >>]       //průběžný součet držený v předchozí (i); to se tak vynuluje
  <<<< -            //do momentální (i) se uloží součet a pokračuje se dál
]                   //nakonec pointer končí na vynulovaném (CH) a součet $n
                    //je uložen v prvním indexu
>>
[
  -                 //přesunutí $n z prvního (i) do (n)
  <<<<< <<<<< < +
  >>>>> >>>>> >
]

/* příprava na zahájení hlavního cyklu */

<<<<< <<<<<
<<<<< << .          //odřádkování
>>>> [-] > [-]      //vynulování čtvrté a páté buňky (x_rcw) a (y_rcw)
>> +                //(x_real) = 1
> +                 //(y_real) = 1

/* hlavní cyklus */

[

  /* určení relativních souřadnic */

  <<
  [
    -               //přesunutí $n
    >>>>> >>> +     //do (y_rlt)
    < +             //do (x_rlt)
    < +             //a do (T4) pro obnovu
    <<<<< <
  ]

  >>>>> >
  [
    -               //obnova $n z (T4)
    <<<<< < +
    >>>>> >
  ]
                    //následující cyklus proběhne dvakrát; poprvé pro (x_real)
                    //podruhé pro (y_real) pro (T1) už ne
                    //poprvé se využijí buňky
                    //(x_rcw)()()(x_real)()(T1)(T2)(T3)()(x_rlt)
                    //podruhé se využijí buňky
  <<<<<             //(y_rcw)()()(y_real)()(T2)(T3)(T4)()(y_rlt)
  [                 //obecně (X_rcw)()()(X_real)()(TX1)(TX2)(TX3)()(X_rlt)
    >>>>> >
    [
      -             //přesun předpřipraveného $n z (X_rlt) do (TX3)
      << +
      >>
    ]

    <<<<< <<<<
    [
      -             //přesunutí $X_rcw
      >>>>> > +     //do (TX2)
      < +           //a do (TX1) pro obnovu
      <<<<<
    ]

    >>>>>
    [
      -             //obnova $X_rcw z (TX1)
      <<<<< +
      >>>>>
    ]

    <<
    [
      -             //přesunutí $X_real
      >>>>> > +     //do (X_rlt)
      <<<< +        //a do (TX1) pro obnovu
      <<
    ]

    >>
    [
      -             //obnova $X_real z (TX1)
      << +
      >>
    ]

    >               //přesun na (TX2)
    [

      /* výpočet relativní souřadnice podle vzorce */
      /* X_rlt = X_real plus 1 mínus 2*(X_real mínus n) */

      -             //pokud se tento cyklus spustil $X_rcw v (TX2) byla
                    //jednička; tímto ji tedy vynulujeme

      >>>           //před tímto cyklem se do (X_rlt) zapsalo $X_real
      [             //to by tam také zůstalo pokud by se tento cyklus nespustil
        -           //protože se ale spustil $X_real se z (X_rlt) zkopíruje
        <<<< +      //do (TX1)
        > +         //a do (TX2)
        >>>
      ]

      <<<< +        //v (TX1) je $X_real plus 1

      >>
      [
        -           //odečtení $n v (TX3)
        < -         //od $X_real v (TX2)
        >
      ]

      <
      [
        -           //odečtení dvojnásobku $X_real mínus $n v (TX2)
        < --        //od $X_real plus 1 v (TX1)
        >
      ]

      <
      [
        -           //přesun vypočítaného $X_rlt z (TX1)
        >>>> +      //do (X_rlt)
        <<<<
      ]

      >             //přesun zpět na (TX2)
    ]

    > [-]           //vynulování (TX3)
    <<<             //přesun na mezeru mezi (X_real) a (TX1) pro další iteraci
  ]

  /* zjištění char_no (char_no = menší z x_rlt a y_rlt) */

  >>>>
  [
    -               //přesunutí $x_rlt
    >>> +           //do (char_no)
    <<<<< << +      //a do (T1)
    >>>>
  ]

  >
  [
    -               //přesunutí $y_rlt
    <<<< +          //do (T2)
    > +             //a do (T3) pro obnovu
    >>>
  ]

  <<<
  [
    -               //obnova $y_rlt z (T3)
    >>> +
    <<<
  ]
                    //následující cyklus bude zjišťovat jestli je $x_rlt menší
                    //než $y_rlt; pokud se ukáže že ano nestane se nic protože
                    //v (char_no) už je zapsáno $x_rlt; pokud ne do (char_no)
                    //se uloží $y_rlt
  +                 //do (T3) se zapíše jednička bude fungovat jako záchytný bod
  <<                //přesun na (T1)
  [                 //cyklus zjišťuje jestli při postupném odečítání klesne
                    //na nulu dřív (T1) nebo (T2)
    > -             //odečtení jedné z (T2)
                    //pokud tímto (T2) klesla na nulu pointer zůstane na (T2)
    [> -]           //jinak se dostane na záchytný bod v (T3) který vynuluje

    >               //přesun buď na (T3) s jedničkou (když (T2) = 0) nebo na
                    //nulové (T4) (když (T2) != 0)
    [               //pokud se spustil tento cyklus (T2) tedy $y_rlt kleslo
                    //na nulu dřív a je tedy menší
      >>>>> [-]     //proto se vynuluje (char_no) a uloží se do něj $y_rlt

      <<
      [
        -           //přesun $y_rlt z (y_rlt)
        >> +        //do (char_no)
        <<
      ]

      <<<<< [-] +   //do (T1) se zapíše jednička aby se při nejbližším dalším
                    //odečtení cyklus ukončil
      >> -          //vynulování (T3) v kvůli sjednocení větví programu
      >             //přesun na nulové (T4)
    ]

    < +             //přesun na nyní nulový záchytný bod (T3) a zapsání jedničky
    << -            //odečtení jedné z (T1); pokud tímto (T1) tedy $x_rlt
                    //klesne na nulu znamená to že $x_rlt bylo menší
  ]                 //cyklus se ukončí a v (char_no) zůstane $x_rlt

  > [-]             //vynulování (T2)
  > -               //a (T3)
  >>> [-]           //a (y_rlt)

  /* výpis znaku (char_notý znak z vstupu) */

  >>                //přesun na (char_no)
  [                 //dokud v (char_no) nebude nula
    >               //přesuň se na první index

    [>>]            //hledej ob dvě buňky nejbližší nulu = nejbližší
                    //nulový index
    +               //až ho najdeš zapiš do něj jedničku
    [<<]            //a hledej směrem doleva ob dvě buňky nejbližší nulu =
                    //přesun na (CH)

    > -             //přesun zpět na (char_no) a odečtení jedné
  ]                 //tímto cyklem se tedy vynulovalo (char_no) a do určitého
                    //počtu (i) se zapsaly jedničky

  > [>>]            //vyhledání prvního nenulového indexu = ten za hledanou
                    //buňkou
  < .               //přesun na hledanou buňku a výpis

  < [- <<]          //přesun na nejbližší nenulovou buňku (CH) se souběžným
                    //mazáním jedniček z (i)

  <<<<< <<<<< <<<< .//výpis mezery

  /* změna souřadnic a testy na změnu způsobu výpočtu relativních souřadnic */
  /* na dosažení konce řádku a konce výpisu */

  >>>>> > +         //zvětšení (x_real)

  /* test na změnu způsobu výpočtu relativní souřadnice x (x = n plus 1) */

  [
    -               //přesunutí $x_real
    >> +            //do (T1)
    > +             //a do (T2) pro obnovu
    <<<
  ]

  >>>
  [
    -               //obnova $x_real z (T2)
    <<< +
    >>>
  ]

  <<<<
  [
    -               //odečtení $n
    >>> -           //od (T1)
    > +             //přesunutí do (T2)
    > +             //a do (T3) pro obnovu
    <<<<<
  ]

  >>>>>
  [
    -               //obnova $n z (T3)
    <<<<< +
    >>>>>
  ]

  << -              //v (T1) je $x_real mínus $n mínus 1
  <<<<< +           //zvětšení (x_rcw) o jedna

  >>>>>             //pokud je v (T1) nula tento cyklus neproběhne a v (x_rcw)
  [                 //zůstane jednička
    <<<<< -         //v opačném případě se změna v (x_rcw) anuluje

    >>>>> >
    [               //je potřeba vynulovat také (T1) ale může tam být i záporná
      -             //hodnota; proto se kvůli zachování portability nejprve
      < +           //k (T1) přičte $n z (T2)
      >
    ]

    < [-]           //až pak se může (T1) bezpečně vynulovat
  ]

  /* test na dosažení konce řádku (x = 2n plus 1) */

  <<<
  [
    -               //přesunutí $n
    >>>> ++         //do (T2) dvojnásobně
    < +             //a do (T1) pro obnovu
    <<<
  ]

  >>>
  [
    -               //obnova $n z (T1)
    <<< +
    >>>
  ]

  > +               //v (T2) je 2*$n plus 1

  <<<
  [
    -               //odečtení $x_real
    >>> -           //od (T2) pro vyhodnocení podmínky
    < +             //a přesunutí do (T1) pro obnovu
    <<
  ]

  >>
  [
    -               //obnova $x_real z (T1)
    << +
    >>
  ]

  +                 //v buňce (T1) dojde k finálnímu rozhodnutí podmínky
  >                 //pokud je v buňce (T2) nula pak $x = 2*$n plus 1 a tedy je
                    //třeba zvětšit (y_real); v tom případě se tento cyklus ani
  [                 //nespustí a v (T1) zůstane jednička; jestli ale tento
    < -             //cyklus proběhne není třeba zvětšovat (y_real)
    > [-]           //proto se (T1) vynuluje a stejně tak i (T2)
  ]

  <                 //přesun na (T1)

  [

    /* úprava souřadnic a odřádkování */

    -               //vynulování (T1) kvůli ukončení tohoto cyklu a sjednocení
    <<<<< <<<< .    //odřádkování
    >>>> -          //nastavení (x_rcw) na nulu
    >>> [-] +       //nastavení (x_real) na jedna
    > +             //zvětšení (y_real) o jednu

    /* test na změnu způsobu výpočtu relativní souřadnice y (y = n plus 1) */

    [
      -             //přesunutí $y_real
      > +           //do (T1)
      > +           //a do (T2) pro obnovu
      <<
    ]

    >>
    [
      -             //obnova $y_real z (T2)
      << +
      >>
    ]

    <<<<
    [
      -             //odečtení $n
      >>> -         //od (T1)
      > +           //přesunutí do (T2)
      > +           //a do (T3) pro obnovu
      <<<<<
    ]

    >>>>>
    [
      -             //obnova $n z (T3)
      <<<<< +
      >>>>>
    ]

    << -            //v (T1) je $y_real mínus $n mínus 1
    <<<< +          //zvětšení (y_rcw) o jedna

    >>>>            //pokud je v (T1) nula tento cyklus neproběhne a v (y_rcw)
    [               //zůstane jednička
      <<<< -        //v opačném případě se změna v (y_rcw) anuluje

      >>>>>
      [             //je potřeba vynulovat také (T1) ale může tam být i záporná
        -           //hodnota; proto se kvůli zachování portability nejprve
        < +         //k (T1) přičte n z (T2)
        >
      ]

      < [-]         //až pak se může (T1) bezpečně vynulovat
    ]

    /* test na dosažení konce výpisu (y = 2n plus 1) */

    <<<
    [
      -             //přesunutí $n
      >>>> ++       //do (T2) dvojnásobně
      < +           //a do (T1) pro obnovu
      <<<
    ]

    >>>
    [
      -             //obnova $n z (T1)
      <<< +
      >>>
    ]

    > +             //v (T2) je 2*$n plus 1

    <<
    [
      -             //odečtení $y_real
      >> -          //od (T2) pro vyhodnocení podmínky
      < +           //a přesunutí do (T1) pro obnovu
      <
    ]

    >
    [
      -             //obnova $y_real z (T1)
      < +
      >
    ]

    +               //v buňce (T1) dojde k rozhodnutí podmínky
    >               //pokud je v buňce (T2) nula pak y = 2*$n plus 1 a tedy je
                    //třeba ukončit výpis; v tom případě se tento cyklus ani
    [               //nespustí a v (T1) zůstane jednička
      < -           //jestli ale tento cyklus proběhne ještě není konec
      > [-]         //proto se (T1) vynuluje a stejně tak i (T2)
    ]

    <               //přesun na (T1)

    [

      /* vynulování ypsilonové souřadnice pro ukončení výpisu */

      -             //vynulování (T1) kvůli ukončení tohoto cyklu a sjednocení
      < [-]         //vynulování (y_real)
      >             //přesun zpět na (T1)
    ]
  ]

  <                 //přesun na (y_real) pro vyhodnocení ukončení
]


                                 MEMORY CELLS

[0  -]   0   1   2    3    4          5       6     7       8     9  10  11  12
[- 12] (10)(30)(40)(70)(100/x_rcw)(110/y_rcw)(n)(x_real)(y_real)(T1)(T2)(T3)(T4)

[13  -]    13     14   15    16     17 18 19 20 [...]
[- inf] (x_rlt)(y_rlt)(CH)(char_no)(i)(1)(i)(2) [...]

/* TODO */
Sel by sloucit /* test na dosažení konce řádku (x = 2n plus 1) */ a
/* test na dosažení konce výpisu (y = 2n plus 1) */ ?
U vypisu je zbytecna (40); nikdy se nepouzije
