;Lista 2 zadanie 9

file = 'F:\Astronomia\IIstopien\IDL\widmo.dat'
rows = file_lines(file)

OPENR, 1, file
d = fltarr(1)
data = []
for n=0, rows-1 do begin
  readf, 1, d
  data = arrinsert(data, d, at=-1)
endfor

close, 1

smg = gauss_smooth(data, 125, /edge_truncate)


;smooth1 = ts_smooth(smg[1:n_elements(smg)-1],4000,/backward)
;smooth2 = ts_smooth(smooth1[1:n_elements(smooth1)-50],3000)
;smooth3 = ts_smooth(smooth2[1:n_elements(smooth2)-50],2000,/backward)
;smooth4 = ts_smooth(smooth3[1:n_elements(smooth3)-1],2000)

smooth1 = ts_smooth(smg[1:n_elements(smg)-1],4000,/backward)
smooth2 = ts_smooth(smooth1[1:n_elements(smooth1)-50],3000)
smooth3 = ts_smooth(smooth2[1:n_elements(smooth2)-50],2000,/backward)
smooth4 = ts_smooth(smooth3[1:n_elements(smooth3)-1],2000)

plot, data, ytitle = "Natezenie promieniowania", xtitle = 'Dlugosc fali'
oplot, smooth4, color=cgcolor('red')


spec = 0.
con = 0.
for i=0, n_elements(data)-1 do begin
  if i eq n_elements(smooth4)-1 then break
  if data[i] gt smooth4[i] then spec += 1
  if data[i] le smooth4[i] then con += 1  
endfor

print, "Procent nalezacy do spektrum: ", spec/n_elements(smooth4)*100.
print, "Procent nalezacy do continuum: ", con/n_elements(smooth4)*100.

;Rysowanie do .ps
dev = !d.name
set_plot,"ps"
device, xs = 20, ys = 20, filename = "L2Z9.ps"
plot, data, ytitle = "Natezenie promieniowania", xtitle = 'Dlugosc fali'
oplot, smooth4, color=cgcolor('red')
device,/close
set_plot, dev
end