read, "Podaj poczatek przedzialu w stopniach Celsjusza: ", cp
read, "Podaj koniec przedzialu w stopniach Celsjusza: ", ck
read, "Podaj krok: ", step

cp = float(cp)
ck = float(ck)
step = float(step)

;cp = 0.
;ck = 20.
;step = 0.5

n = (ck-cp)/step
clist = []


;Tworzenie tablicy st celsjusza

for i=0, n do begin
  clist = arrinsert(clist,cp,at=-1)
  cp += step
endfor

;Przeliczanie stopni celsjusza na stopnie farenhaita
flist = []

for j=0, n_elements(clist)-1 do begin
  flist = arrinsert(flist, 32.+9./5.*clist[j],at=-1)
endfor

for i=0, n_elements(clist)-1 do begin
  print, clist[i], " Stopni Celsjusza to", flist[i], " stopni Fahrenheita"
endfor


end