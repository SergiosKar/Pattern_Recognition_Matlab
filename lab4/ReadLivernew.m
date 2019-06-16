function [x,c,x1,x2] = ReadLivernew(Tot)
%#
%#  [x,c] = ReadLiver(Tot)
%#   Read the Liver database stored in the file "liverdisorder.data"
%#  Input:
%#      Tot: Number of Patterns
%#  Output:
%#      x: Patterns matrix
%#      c: Classes integer

if ( Tot > 345 )
   Tot = 345 ;
end

k=0;
l=0;

x1=zeros(6,145);
x2=zeros(6,200);
f1 = fopen( 'C:\Users\User\Desktop\matlab folder\lab4\liverdisorder.data', 'r' ) ;
x = zeros(6,Tot) ;
c = zeros(1,Tot) ;
for j = 1:Tot
	for i = 1:6
   	x(i,j) = fscanf( f1, '%f', 1 ) ; 
    end
	c(1,j) = fscanf( f1, '%d', 1 ) ;
    if (c(1,j)==1)
        k=k+1;
        x1(:,k)=x(:,j);
    
    else
        l=l+1;
        x2(:,l)=x(:,j);   
    end
end
fclose(f1);
