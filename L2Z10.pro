;Lista 2 zadanie 10
a = ''
read, "Podaj lancuch znakow: ", a


FOR i=0, a.StrLen( )-1  DO begin
  subString = STRMID(a, 0, i+1)
  print, subString
endfor


end