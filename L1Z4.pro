; Lista 1 Zad 4

print,"Wprowadź obecna date"
read,"Rok: ",L
read,"Miesiac: ",M
read,"Dzien: ",N
L=2021
M=1
N=30

print,"Wprowadz date urodzenia"
read,"Rok: ",L0
read,"Miesiac: ",M0
read,"Dzien: ",N0
;L0=1996
;M0=7
;N0=25


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


L1 = L + 4716 - long((14.0-M)/12.0)
M1 = (M+9.0) mod 12.0
G = long(3./4.*long((L1+184.0)/100.0))-38

JD = long(365.25*L1)+long(30.6*M1+0.4)+N-G-1402

L01 = L0 + 4716 - long((14.0-M0)/12.0)
M01 = (M0+9.0) mod 12.0
G0 = long(3./4.*long((L01+184.0)/100.0))-38

JD0 = long(365.25*L01)+long(30.6*M01+0.4)+N0-G0-1402


ph=[]
em=[]
int=[]

ppar = 23.
epar = 28.
ipar = 33.
days = FINDGEN(35*100, INCREMENT=0.001, START=JD)

for i=0, n_elements(days)-1 do begin
 
  ph = arrinsert(ph, ((sin(2.0*!PI*((JD+i-JD0)/ppar))+1.)/2.)*100., at=-1)  
 
  em = arrinsert(em, ((sin(2.0*!PI*((JD+i-JD0)/epar))+1.)/2.)*100., at=-1)  

  int = arrinsert(int, ((sin(2.0*!PI*((JD+i-JD0)/ipar))+1.)/2.)*100., at=-1)

endfor

;sec = DINDGEN(35*900, INCREMENT = 0.001)*24.*60.*60.

start = day + "-" + month + "-" + year

;sec = DINDGEN(35*100, INCREMENT = 0.01) * 24. * 60. * 60.

sec = DINDGEN(35)*24.*3600.

utplot, sec, ph, start, title = "Biorytmy"
plots, sec, ph, color=cgColor("red")
plots, [432000,518400], 51, color=cgColor("red"), thick=4
xyouts,86400, 50, 'Fizyczny', charsize=1.5
plots, sec, em, color=cgColor("green")
plots, [518400,604800], 46, color=cgColor("green"), thick=4
xyouts,86400, 45, 'Emocjonalny', charsize=1.5
plots, sec, int, color=cgColor("blue")
plots, [518400,604800], 41, color=cgColor("blue"), thick=4
xyouts,86400, 40, 'Intelektualny', charsize=1.5


dev = !d.name
set_plot,"ps"
device, xs = 20, ys = 20, filename = "L1Z4.ps"
utplot, sec, ph, start, title = "Biorytmy"
plots, sec, ph, color=cgColor("red")
plots, [518400,604800], 51, color=cgColor("red"), thick=4
xyouts,86400, 50, 'Fizyczny', charsize=1.5
plots, sec, em, color=cgColor("green")
plots, [691200,777600], 46, color=cgColor("green"), thick=4
xyouts,86400, 45, 'Emocjonalny', charsize=1.5
plots, sec, int, color=cgColor("blue")
plots, [691200,777600], 41, color=cgColor("blue"), thick=4
xyouts,86400, 40, 'Intelektualny', charsize=1.5
device,/close
set_plot, dev
end