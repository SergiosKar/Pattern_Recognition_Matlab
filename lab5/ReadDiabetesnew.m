function [x1,x2,c] = ReadDiabetesnew(Tot)
%#
%#  [x,c] = ReadWine(Tot)
%#   Read the Wine database stored in the file "pima-indians-diabetes.data"
%#  Input:
%#      Tot: Number of Patterns
%#  Output:
%#      x: Patterns matrix
%#      c: Classes integer
k=0;
l=0;

x1=zeros(8,500);
x2=zeros(8,268);


f1 = fopen( 'C:\Users\User\Desktop\matlab folder\lab5\pima-indians-diabetes.data', 'r' ) ;
x = zeros(8,Tot) ;
c = zeros(1,Tot) ;
for j = 1:Tot
	for i = 1:8
   	x(i,j) = fscanf( f1, '%f', 1 ) ; 
	end
	c(1,j) = fscanf( f1, '%d', 1 ) + 1 ;
    
    if (c(1,j)==1)
        k=k+1;
        x1(:,k)=x(:,j);
       
    
    else
        l=l+1;
        x2(:,l)=x(:,j);   
    end
end
fclose(f1) ;
