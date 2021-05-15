; Lista 1 Zad 6

print,"Wprowadź date urodzin"
read,"Rok: ",L
read,"Miesiac: ",M
read,"Dzien: ",N


L1 = L + 4716 - long((14.0-M)/12.0)
M1 = (M+9.0) mod 12.0
G = long(3./4.*long((L1+184.0)/100.0))-38

JD = long(365.25*L1)+long(30.6*M1+0.4)+N-G-1402

;print,"Ile dni dodac?"
;read, days


days = 7500.

for k=0, 5 do begin
  JD1 = JD + days
  
  ;Zamiana dnia juliańskiego na date kalendarza gregoriańskiego
  GR = long(3/4*long((JD1+68569)/36524.25))-38
  J = 4*(JD1+GR+1401)+3
  I = 2 + 5*long((J mod 1461)/4)
  N = 1 + long((I mod 153)/5)
  M = 1 + (2 + long(I/153)) mod 12
  L = long(J/1461)-4716+long((14-M)/12)
  
  print, long(days), " dni od daty urodzenia mija: ", N, M, L
  
  days += 500
  i += 1
endfor

end