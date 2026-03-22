(* ::Package:: *)

ParabolaMasas[A0_] := Module[{data, data2, datosA, datosOrdenados, datosUnicos, 
datosM, elementos, minimo, posMin, subdatos, subelementos, i1, i2, nLado = 3, 
xmin, xmax, ymin, ymax, dy, minimoSub, zMinSub, mMinSub, posMinSub, pares, impares, 
fit, flechasIzq, flechasDer, etiquetasIzq, etiquetasDer, etiquetaEstable, etiquetasElementos, 
tablaDatos, grafica, fitpar, fitimpar},
  data = Import["C:\\Users\\ruben\\Desktop\\Pr\[AAcute]cticas Nuclear\\Pr\[AAcute]ctica 1 Radio nuclear y energ\[IAcute]a de ligadura nuclear. Ficheros-20260304\\excesodemasas.txt", "Table"];
  data2 = Rest[data];
  datosA = Select[data2, Length[#] >= 7 && NumericQ[#[[1]]] && NumericQ[#[[3]]] && NumericQ[#[[7]]] && #[[1]] == A0 &];
  If[Length[datosA] == 0, Print["No hay datos v\[AAcute]lidos para A = ", A0];
   Abort[];];
  datosOrdenados = SortBy[datosA, #[[3]] &];
  datosUnicos = Values@GroupBy[datosOrdenados, #[[3]] &, First@MinimalBy[#, #[[7]] &] &];
  datosUnicos = SortBy[datosUnicos, #[[3]] &];
  datosM = ({#[[3]], #[[7]]} &) /@ datosUnicos;
  elementos = #[[2]] & /@ datosUnicos;
  minimo = MinimalBy[datosM, Last][[1]];
  posMin = First@FirstPosition[datosM, minimo];
  i1 = Max[1, posMin - nLado];
  i2 = Min[Length[datosM], posMin + nLado];
  subdatos = datosM[[i1 ;; i2]];
  subelementos = elementos[[i1 ;; i2]];
  If[Length[subdatos] < 2 nLado + 1 && Length[datosM] >= 2 nLado + 1, If[i1 == 1, subdatos = datosM[[1 ;; 2 nLado + 1]];
     subelementos = elementos[[1 ;; 2 nLado + 1]], subdatos = datosM[[-(2 nLado) ;; -1]];
     subelementos = elementos[[-(2 nLado) ;; -1]]];];
  minimoSub = MinimalBy[subdatos, Last][[1]];
  zMinSub = minimoSub[[1]];
  mMinSub = minimoSub[[2]];
  posMinSub = First@FirstPosition[subdatos, minimoSub];
  xmin = Min[subdatos[[All, 1]]];
  xmax = Max[subdatos[[All, 1]]];
  ymin = Min[subdatos[[All, 2]]];
  ymax = Max[subdatos[[All, 2]]];
  dy = ymax - ymin;
  pares = Select[subdatos, EvenQ[#[[1]]] &];
  impares = Select[subdatos, OddQ[#[[1]]] &];
  fit = Fit[subdatos, {1, x, x^2}, x];
  fitpar = Fit[pares, {1, x, x^2}, x];
  fitimpar=Fit[impares, {1, x, x^2}, x];
  flechasIzq = Table[Arrow[{subdatos[[i]], subdatos[[i + 1]]}], {i, 1, posMinSub - 1}];
  flechasDer = Table[Arrow[{subdatos[[i]], subdatos[[i - 1]]}], {i, Length[subdatos], posMinSub + 1, -1}];
  etiquetasIzq = Table[Text[Style["\[Beta]-", 18, Blue, Bold], Mean[{subdatos[[i]], subdatos[[i + 1]]}] + {0, 0.04 (ymax - ymin)}], {i, 1, posMinSub - 1}];
  etiquetasDer = Table[Text[Style["\[Beta]+/EC", 18, Darker[Red], Bold], Mean[{subdatos[[i]], subdatos[[i - 1]]}] + {0, 0.04 (ymax - ymin)}], {i, Length[subdatos], posMinSub + 1, -1}];
  etiquetaEstable = {Text[Style["N\[UAcute]cleo estable", 18, Darker[Green], Bold], minimoSub + {0.2, -0.06 (ymax - ymin)}]};
  etiquetasElementos = Table[Inset[Style[Row[{ToString[subelementos[[i]]], "-", A0}], 22, Black, Bold, Background -> White], N[subdatos[[i]] + {0.08, 0.025*dy}]], {i, Length[subdatos]}];
  tablaDatos = TableForm[MapThread[{#1[[1]], #1[[2]], #2} &, {subdatos, subelementos}], TableHeadings -> {None, {"Z", "Exceso de masa", "Elemento"}}];
  Print["Datos usados:"];
  Print[tablaDatos];
  Print["Funciones cargadas correctamente"];
  If[EvenQ[A0],
  grafica = Show[
   {
    ListPlot[
      pares,
      PlotStyle -> Blue,
      PlotMarkers -> {Automatic, 10}
    ],
    ListPlot[
      impares,
      PlotStyle -> Red,
      PlotMarkers -> {Automatic, 10}
    ],
    Plot[
      fitpar,
      {x, xmin, xmax},
      PlotStyle -> {Dashed, Orange},
      PlotLegends -> Placed[{Style["Par-par",18]}, {0.3, 0.85}]
    ],
    Plot[
    fitimpar,
    {x, xmin, xmax},
    PlotStyle->{Dashed, Green},
    PlotLegends -> Placed[{Style["Impar-impar",18]}, {0.3, 0.8}]
    ],
    Graphics[
      {
       Thick, Darker[Gray],
       flechasIzq,
       flechasDer,
       etiquetasIzq,
       etiquetasDer,
       etiquetasElementos
      }
    ]
   },
   AxesLabel -> {"Z", "\[CapitalDelta]M (MeV)"},
   PlotLabel -> Style[Row[{"Par\[AAcute]bola de masas para ", Style["A", Italic], " = ", A0}], 32, Bold],
   PlotRange -> All,
   ImageSize -> 1300
];
  grafica]
  If[OddQ[A0],grafica = Show[
   {
    ListPlot[
      pares,
      PlotStyle -> Blue,
      PlotMarkers -> {Automatic, 10}
    ],
    ListPlot[
      impares,
      PlotStyle -> Red,
      PlotMarkers -> {Automatic, 10}
    ],
    Plot[
      fit,
      {x, xmin, xmax},
      PlotStyle -> {Dashed, Pink}
    ],
    Graphics[
      {
       Thick, Darker[Gray],
       flechasIzq,
       flechasDer,
       etiquetasIzq,
       etiquetasDer,
       etiquetaEstable,
       etiquetasElementos
      }
    ]
   },
   AxesLabel -> {"Z", "\[CapitalDelta]M (MeV)"},
   PlotLabel -> Style[Row[{"Par\[AAcute]bola de masas para ", Style["A", Italic], " = ", A0}], 32, Bold],
   PlotRange -> All,
   ImageSize -> 1300
];

grafica]
  
  ]
