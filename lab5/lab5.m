%[x,c] = ReadDiabetes(768)
%[x1,x2,c] = ReadDiabetesnew(768)

[w,Rc,Rep] = HoKa(x1,x2,1,100)

