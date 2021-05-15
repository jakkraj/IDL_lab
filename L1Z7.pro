; Lista 1 Zad 7

print, "Liczenie pola i objetosci stozka"
print, "Podaj promien podstawy i wysokosc"
read, "Promien podstawy: ", r 
read, "Wysokosc: ", h

l = sqrt(h^2+r^2)
print, "Dlugosc tworzacej stozka: ",l

Sp = !PI*r^2
print, "Pole podstawy stozka: ",Sp

Sb = !PI*r*l
print, "Pole powierzchni bocznej stozka: ",Sb

S = Sp + Sb
print, "Pole powierzchni calkowitej: ",S

V = (Sp*h)/3
print, "Objetosc stozka: ",V

end