;Lista 2 zadanie 11


str = ''
let = ''
read, 'Podaj lancuch znakow: ', str
read, 'Podaj litere do policzenia (wielkosc litery ma znaczenie)', let

cap_ascii = [65:90]
small_ascii = [97:122]
letbyte = byte(let)
senbyte = byte(str)
char = []
newrev = ''
rev = MAKE_ARRAY(n_elements(senbyte), /INTEGER, VALUE = 0)


capital = n_elements(senbyte[WHERE(senbyte ge 65 and senbyte le 90)]) 
small = n_elements(senbyte[WHERE(senbyte ge 97 and senbyte le 122)])

left = n_elements(senbyte[WHERE(senbyte eq 40)])
right = n_elements(senbyte[WHERE(senbyte eq 41)])

brackets = left + right

c = strcompress(str, /remove_all)
space = strlen(str)-strlen(c)

split = STRSPLIT(str, /COUNT)
words = n_elements(split)

sentences = 1
s_c = where(senbyte eq 46, count)
if n_elements(s_c) gt 0 then sentences = n_elements(STRSPLIT(str, '.', /COUNT, /EXTRACT))


;1 

print, "Ilosc spacji: ", space
print, "Ilosc malych liter: ", small
print, 'Ilosc wielkich liter: ', capital
print, 'Ilosc nawiasow', brackets
print, 'Ilosc slow: ', words
print, 'Ilosc zdan: ', sentences

;2

if left eq right then print, 'Liczba nawiasow otwierajacych i zamykajacych jest taka sama.'
     
if left gt right then begin
  print, 'Liczba nawiasow otwierajacych jest wieksza niz zamykajacych.'
endif else begin
  if left lt right then begin
    print, 'Liczba nawiasow zamykajacych jest wieksza niz otwierajacych.'
  endif
endelse

;3

for i=0, n_elements(senbyte)-1 do begin
  if ((senbyte[i] ge 32 and senbyte[i] le 64) or (senbyte[i] ge 91 and senbyte[i] le 96) or $
    (senbyte[i] ge 123 and senbyte[i] le 126)) then rev[i] = senbyte[i]
  if (senbyte[i] ge 65 and senbyte[i] le 90) then begin
    b = where(cap_ascii eq senbyte[i])
    rev[i] = small_ascii[b]   
  endif else begin
    if (senbyte[i] ge 97 and senbyte[i] le 122) then begin
      c = where(small_ascii eq senbyte[i])
      rev[i] = cap_ascii[c]
    endif
  endelse
endfor

rev = rev[where(rev ne 0)]
rev = byte(rev)
print, 'Odwrocona wielkosc liter: ', string(rev)

;4

lett = n_elements(STRSPLIT(str, let, /COUNT, /EXTRACT))-1
print, 'Liczba wystapien litery ', let, ': ', lett


end