; Lista 1 Zad 2

print,"Wprowadź wybrana date"
read,"Rok: ",L
read,"Miesiac: ",M
read,"Dzien: ",N

;print,L,M,N

L1 = L + 4716 - long((14.0-M)/12.0)
M1 = (M+9.0) mod 12.0
G = long(3./4.*long((L1+184.0)/100.0))-38

JD = long(365.25*L1)+long(30.6*M1+0.4)+N-G-1402

print, FORMAT="(F15.1)", JD

end