print, "Podaj wartosci wielomianu"

read, "a: ", a
read, "b: ", b
read, "c: ", c

;a = 2
;b = 5
;c = 2



;y = a*x^2+b*x+c 

del = b^2 - 4*a*c

if del lt 0 then print, 'Delta ujemna. Brak miejsc zerowych.'

if del gt 0 then begin
  x1 = (-b-sqrt(del))/(2*a)
  x2 = (-b+sqrt(del))/(2*a)
  
  x = [x1-5:x2+5:0.5]
  ylist = []
  zerolist = []
  
  for i=0, n_elements(x)-1 do begin
    y = a*x[i]^2+b*x[i]+c
    ylist = arrinsert(ylist,y,at=-1)
    zerolist = arrinsert(zerolist,0,at=-1)
  endfor
  plot, x, ylist
  plots, [x1,0], psym=2, symsize=4
  plots, [x2,0], psym=2, symsize=4
  oplot, x, zerolist, linestyle=3
  xyouts, x1-0.5, 5, 'x1 =', charsize=1.5
  xyouts, x1, 5, x1 , charsize=1.5
  xyouts, x2-0.5, -7, 'x2 =', charsize=1.5
  xyouts, x2, -7, x2 , charsize=1.5
  
  dev = !d.name
  set_plot,"ps"
  device, xs = 20, ys = 20, filename = "L2Z4.ps"
  plot, x, ylist
  plots, [x1,0], psym=2, symsize=4
  plots, [x2,0], psym=2, symsize=4
  oplot, x, zerolist, linestyle=3
  xyouts, x1-0.5, 5, 'x1 =', charsize=1.5
  xyouts, x1, 5, x1 , charsize=1.5
  xyouts, x2-0.5, -7, 'x2 =', charsize=1.5
  xyouts, x2, -7, x2 , charsize=1.5
  device,/close
  set_plot, dev
  
  print, 'Miejsca zerowe funkcji: x1 = ',x1,', x2 = ',x2
endif

if del eq 0 then begin
  x0 = (-b-sqrt(del))/(2*a)
  
  x = [x0-5:x0+5:0.5]
  ylist = []
  zerolist = []
  
  for i=0, n_elements(x)-1 do begin
    y = a*x[i]^2+b*x[i]+c
    ylist = arrinsert(ylist,y,at=-1)
    zerolist = arrinsert(zerolist,0,at=-1)
  endfor
  plot, x, ylist
  plots, [x0,0], psym=2, symsize=4
  oplot, x, zerolist, linestyle=3
  xyouts, x0-0.5, 5, 'x0 =', charsize=1.5
  xyouts, x0, 5, x0 , charsize=1.5
  
  dev = !d.name
  set_plot,"ps"
  device, xs = 20, ys = 20, filename = "L2Z4.ps"
  plot, x, ylist
  plots, [x0,0], psym=2, symsize=4
  oplot, x, zerolist, linestyle=3
  xyouts, x0-0.5, 5, 'x0 =', charsize=1.5
  xyouts, x0, 5, x0 , charsize=1.5
  device,/close
  set_plot, dev
  
  print, 'Miejsce zerowe funkcji: x0 = ',x0
endif





end