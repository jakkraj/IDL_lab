; Lista 1 Zad 5

print,"Wprowadź date poczatkowa"
read,"Rok: ",L
read,"Miesiac: ",M
read,"Dzien: ",N
;L = 223
;M = 4
;N = 5

if N lt 10 then begin
  day = '0'+string(long(N))
  day = strcompress(string(day), /remove_all)
endif
if N ge 10 then day = string(long(N))
year = strcompress(string(long(L)), /remove_all)

if M eq 1 then month = 'Jan'
if M eq 2 then month = 'Feb'
if M eq 3 then month = 'Mar'
if M eq 4 then month = 'Apr'
if M eq 5 then month = 'May'
if M eq 6 then month = 'Jun'
if M eq 7 then month = 'Jul'
if M eq 8 then month = 'Aug'
if M eq 9 then month = 'Sep'
if M eq 10 then month = 'Oct'
if M eq 11 then month = 'Nov'
if M eq 12 then month = 'Dec'


L1 = L + 4716.0 - long((14.0-M)/12.0)
M1 = (M+9.0) mod 12.0
G = long(3./4.*long((L1+184.0)/100.0))-38.

JD = long(365.25*L1)+long(30.6*M1+0.4)+N-G-1402.0
JD = long(JD)


hours = []  


hours = DINDGEN(30*100, INCREMENT=0.01, START=JD)

sec = DINDGEN(30*100, INCREMENT=0.01)*24.*3600.



D = (297.85 + 12.19074912*(hours-2451545)) mod 360.
D[WHERE(D lt 0, /NULL)] = D + 360
  
phase = (-sin(D*!PI/180.+!PI/2.)+1.)/2.


start = day + "-" + month + "-" + year

utplot, sec, phase, start, title = "Fazy Ksiezyca", ytitle = "Faza", $
  thick = 3, color = cgcolor("red"), yrange = [-0.1,1.1], xsty = 1, ysty = 3

fm = 0
nm = 0
ph1 = 0
phl = 0
ph11 = 0
ph12 = 0
ph13 = 0
ph14 = 0
phl1 = 0
phl2 = 0
phl3 = 0
phl4 = 0


for i=0, n_elements(hours)-2 do begin
  
  ;PELNIA
  if phase[i] ge 0.99995 and phase[i+1] lt 0.99995 then begin  
    sym = cgSymCat(16)
    plots, sec[i], 1,  Psym=sym, symsiz = 8
  endif
  
  ;NOW
  if phase[i] le 0.00005 and phase[i+1] gt 0.00005 then begin
    sym = cgSymCat(16)
    plots, sec[i], 0., Psym=sym, symsiz = 8
    plots, sec[i], 0., Psym=sym, symsiz = 7.5, color = cgColor("Black")      
  endif
  
  ;PIERWSZA KWADRA
  if (phase[i] lt 0.51 and phase[i] gt 0.49 and phase[i+1] gt phase[i] and ph1 eq 0) then begin
    sym = cgSymCat(44)
    plots, sec[i], 0.48, Psym=sym, symsiz = 8
    ph1 = 1
  endif
  
  if (phase[i] lt 0.11 and phase[i] gt 0.09 and phase[i+1] gt phase[i] and ph11 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-20000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    ph11 = 1
  endif
  
  if (phase[i] lt 0.31 and phase[i] gt 0.29 and phase[i+1] gt phase[i] and ph12 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-50000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    ph12 = 1
  endif
  
  if (phase[i] lt 0.71 and phase[i] gt 0.69 and phase[i+1] gt phase[i] and ph13 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-80000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    ph13 = 1
  endif
  
  if (phase[i] lt 0.91 and phase[i] gt 0.89 and phase[i+1] gt phase[i] and ph14 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-110000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    ph14 = 1
  endif
  

  
  ;OSTATNIA KWADRA
  if (phase[i] lt 0.53 and phase[i] gt 0.47 and phase[i+1] lt phase[i] and phl eq 0) then begin
    plots, sec[i], 0.52, Psym=cgSymCat(42), symsiz = 8
    phl = 1
  endif
  
  if (phase[i] lt 0.91 and phase[i] gt 0.89 and phase[i+1] lt phase[i] and phl1 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+110000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    phl1 = 1
  endif
  
  if (phase[i] lt 0.71 and phase[i] gt 0.69 and phase[i+1] lt phase[i] and phl2 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+80000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    phl2 = 1
  endif
  
  if (phase[i] lt 0.31 and phase[i] gt 0.29 and phase[i+1] lt phase[i] and phl3 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+50000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    phl3 = 1
  endif
  
  if (phase[i] lt 0.11 and phase[i] gt 0.09 and phase[i+1] lt phase[i] and phl4 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+20000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("Black")
    phl4 = 1
  endif
  
  
  
endfor

utplot, sec, phase, start, thick = 3, color = cgcolor("red"), yrange = [-0.1,1.1], xsty = 1, ysty = 3, /nodata, /noerase



;Rysowanie do .ps
dev = !d.name
set_plot,"ps"
device, xs = 20, ys = 20, filename = "L1Z5.ps"

utplot, sec, phase, start, title = "Fazy Ksiezyca", ytitle = "Faza", $
  thick = 3, color = cgcolor("red"), yrange = [-0.1,1.1], xsty = 1, ysty = 3

fm = 0
nm = 0
ph1 = 0
phl = 0
ph11 = 0
ph12 = 0
ph13 = 0
ph14 = 0
phl1 = 0
phl2 = 0
phl3 = 0
phl4 = 0


for i=0, n_elements(hours)-2 do begin

  ;PELNIA
  if phase[i] ge 0.99995 and phase[i+1] lt 0.99995 then begin
    sym = cgSymCat(16)
    plots, sec[i], 1,  Psym=sym, symsiz = 8
  endif

  ;NOW
  if phase[i] le 0.00005 and phase[i+1] gt 0.00005 then begin
    sym = cgSymCat(16)
    plots, sec[i], 0., Psym=sym, symsiz = 8
    plots, sec[i], 0., Psym=sym, symsiz = 7.5, color = cgColor("white")
  endif

  ;PIERWSZA KWADRA
  if (phase[i] lt 0.51 and phase[i] gt 0.49 and phase[i+1] gt phase[i] and ph1 eq 0) then begin
    sym = cgSymCat(44)
    plots, sec[i], 0.48, Psym=sym, symsiz = 8
    ph1 = 1
  endif

  if (phase[i] lt 0.11 and phase[i] gt 0.09 and phase[i+1] gt phase[i] and ph11 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-20000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    ph11 = 1
  endif

  if (phase[i] lt 0.31 and phase[i] gt 0.29 and phase[i+1] gt phase[i] and ph12 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-50000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    ph12 = 1
  endif

  if (phase[i] lt 0.71 and phase[i] gt 0.69 and phase[i+1] gt phase[i] and ph13 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-80000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    ph13 = 1
  endif

  if (phase[i] lt 0.91 and phase[i] gt 0.89 and phase[i+1] gt phase[i] and ph14 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]-110000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    ph14 = 1
  endif



  ;OSTATNIA KWADRA
  if (phase[i] lt 0.53 and phase[i] gt 0.47 and phase[i+1] lt phase[i] and phl eq 0) then begin
    plots, sec[i], 0.52, Psym=cgSymCat(42), symsiz = 8
    phl = 1
  endif

  if (phase[i] lt 0.91 and phase[i] gt 0.89 and phase[i+1] lt phase[i] and phl1 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+110000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    phl1 = 1
  endif

  if (phase[i] lt 0.71 and phase[i] gt 0.69 and phase[i+1] lt phase[i] and phl2 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+80000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    phl2 = 1
  endif

  if (phase[i] lt 0.31 and phase[i] gt 0.29 and phase[i+1] lt phase[i] and phl3 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+50000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    phl3 = 1
  endif

  if (phase[i] lt 0.11 and phase[i] gt 0.09 and phase[i+1] lt phase[i] and phl4 eq 0) then begin
    plots, sec[i], phase[i], Psym=cgSymCat(16), symsiz = 7
    plots, sec[i]+20000, phase[i], Psym=cgSymCat(16), symsiz = 7, color = cgColor("white")
    phl4 = 1
  endif



endfor

utplot, sec, phase, start, thick = 3, color = cgcolor("red"), yrange = [-0.1,1.1], xsty = 1, ysty = 3, /nodata, /noerase
device,/close
set_plot, dev
end