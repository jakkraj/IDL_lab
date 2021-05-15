;Znajdowanie gwiazd

;240-300

path = 'F:\Astronomia\IIstopien\II_sem\IDL'

READ_JPEG, path+'\stars.jpg', data, TRUE=1

TVSCL, data

stars = MAKE_ARRAY(547, 300, /BYTE, VALUE = 0)
count = 0
cgcol = cgColor("Red")

si = size(data)
rows = si[2]
columns = si[1]
xpos=[]
ypos=[]

stars = data
FOR j=0,rows-1 DO BEGIN
  for i=0, columns-1 do begin
    if data[i,j] lt 40 then stars[i,j] = 0
  endfor
ENDFOR


sipos=[]
sjpos=[]


m = stars[UNIQ(stars, REVERSE(SORT(stars)))]


plot_image, data

t = m
x2 = 0
x1 = 0
y2 = 0
y1 = 0


FOR j=15,rows-2 DO BEGIN
  for i=15, columns-2 do begin


    if((stars[i,j] gt 40) and ((stars[i+1,j] eq 0) and (stars[i+1,j+1] eq 0) and $
      (stars[i,j+1] eq 0) and (stars[i-1,j+1] eq 0) and (stars[i-1,j] eq 0) and $
      (stars[i-1,j-1] eq 0) and (stars[i,j-1] eq 0) and (stars[i+1,j-1] eq 0)) ) then begin
      sipos = arrinsert(sipos, i, at=-1)
      sjpos = arrinsert(sjpos, j, at=-1)
      stars[i,j] = 0
      count += 1
    endif


  endfor
ENDFOR
plots, sipos, sjpos, /continue, psym = cgSymCat(9), color=cgcol, symsize = 2

;print, count


sq = 10
symsize = 4


for k=0, n_elements(m)-1 do begin
  check = 0
  FOR j=10,rows-10 DO BEGIN
    for i=10, columns-10 do begin
      
      if n_elements(t) eq 1 then break
      if stars[i,j] eq max(t) then begin
        check = 1
        plots, i,j, psym = cgSymCat(9), color=cgcol, symsize = symsize
        
        if (i ge columns-sq-1) then begin
          stars[i,j] = 0
        endif
        ;print, max(t)
        if ((i lt columns-sq-1) and (j gt sq+1) and (i gt sq+1) and (j lt rows-sq-1)) then begin
          x1 = i-sq
          x2 = i+sq
          y1 = j-sq
          y2 = j+sq
        
          stars[x1:x2,y1:y2] = 0
          ;print, x1,x2,y1,y2  
        endif
        t = t[where(t ne max(t))]
        
        
      endif
    endfor
  endfor
  if check eq 0 then t = t[where(t ne max(t))]
  if check eq 1 then count += 1 
  if k eq 5 then symsize = 3
  if k eq 5 then sq = 4
endfor
;print, max(t)
;stop
;stars = uniq(stars)

si1 = size(data)
rows1 = si[2]
columns1 = si[1]

FOR j=0,rows1-11 DO BEGIN
  for i=0, columns1-11 do begin
    if stars[i,j] gt 35 then begin
      if ((i lt columns-10-1) and (j gt 10+1) and (i gt 10+1) and (j lt rows-10-1)) then begin
        x1 = i-10
        x2 = i+10
        y1 = j-10
        y2 = j+10

        stars[x1:x2,y1:y2] = 0
        ;print, i, j
        plots, i,j, /continue, psym = cgSymCat(9), color=cgcol, symsize = 3
        count += 1
      endif
    endif
  endfor
ENDFOR

for j=2, rows1-3 do begin
  for i=2, columns1-3 do begin
    if((stars[i,j] gt 35) and ((stars[i+2,j] eq 0) and (stars[i+2,j+2] eq 0) and $
      (stars[i,j+2] eq 0) and (stars[i-2,j+2] eq 0) and (stars[i-2,j] eq 0) and $
      (stars[i-2,j-2] eq 0) and (stars[i,j-2] eq 0) and (stars[i+2,j-2] eq 0)) ) then begin
      x1 = i-2
      x2 = i+2
      y1 = j-2
      y2 = j+2

      stars[x1:x2,y1:y2] = 0
      
      plots, i,j, /continue, psym = cgSymCat(9), color=cgcol, symsize = 3
      count += 1
    endif
  endfor
endfor


print, "Liczba gwiazd na zdjeciu: ", count
end