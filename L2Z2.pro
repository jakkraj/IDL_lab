;Lista 2 zad 2


A = indgen(10)
print, A

B = WHERE(A GT 5, count, COMPLEMENT=B_C, NCOMPLEMENT=count_c)

print, "Liczba elementow > 5: ", count
print, "Indeksy liczb > 5: ", B
print, "Liczba elementow <= 5: ", count_c
print, "Indeksy liczb <= 5: ", B_C

end