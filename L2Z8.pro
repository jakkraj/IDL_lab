;Lista 2 zadanie 8


file = 'F:\Astronomia\IIstopien\IDL\widmo.dat'
rows = file_lines(file)
OPENR, 1, file
d = fltarr(1)
data = []
for n=0, rows-1 do begin
  readf, 1, d
  ;print, d
  data = arrinsert(data, d, at=-1)
endfor

close, 1

end