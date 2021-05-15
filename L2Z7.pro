;Lista 2 zadanie 7

restore, 'tab.sav'
;print, par
linia = []
k=0
for i=5, n_elements(array)-1 do begin
  if k eq 9 then break
  linia = STRSPLIT(array[i], /extract)
  par(k) = {tab, linia[0], linia[1], linia[2], linia[3], linia[4], linia[5], $
               linia[6], linia[7], linia[8], linia[9], linia[10], linia[11]}
  k += 1
endfor


print, 'Wybierz planete (liczbe):'
print, '1.Merkury'
print, '2.Wenus'
print, '3.Ziemia'
print, '4.Mars'
print, '5.Jowisz'
print, '6.Saturn'
print, '7.Uran'
print, '8.Neptun'
print, '9.Pluton'
read, pl



print, 'Wybierz parametr do sprawdzenia:'
print, '1.Srednia predkosc orbitalna'
print, '2.Srednica rownikowa'
print, '3.Splaszczenie'
print, '4.Masa'
print, '5.Srednia gestosc'
print, '6.Objetosc'
print, '7.Przyspieszenie grawitacyjne'
print, '8.Predkosc ucieczki'
read, val



if val eq 1 then print, 'Srednia predkosc orbitalna planety ' + string(par(pl-1).planet) +$
   ' wynosi: ' + string(par(pl-1).v + ' km/s')

if val eq 2 then print, 'Srednica rownikowa planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).diakm) + ' km/s i ' + string(par(pl-1).diae) + ' srednicy Ziemi' 

if val eq 3 then print, 'Splaszczenie planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).flat)

if val eq 4 then print, 'Masa planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).masskg) + ' x 10^24 kg i ' + string(par(pl-1).masse) + ' mas Ziemi'

if val eq 5 then print, 'Srednia gestosc planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).den + ' g/cm^3')

if val eq 6 then print, 'Objetosc planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).vol + ' objetosci Ziemi')

if val eq 7 then print, 'Przyspieszenie grawitacyjne planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).akm) + ' km/s i ' + string(par(pl-1).ae) + ' przyspieszenia Ziemi'

if val eq 8 then print, 'Predkosc ucieczki planety ' + string(par(pl-1).planet) +$
  ' wynosi: ' + string(par(pl-1).esc + ' km/s')



end