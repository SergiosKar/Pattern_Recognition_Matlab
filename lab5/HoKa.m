function [w,Rc,Rep] = HoKa(x1,x2,Lr,MaxRep)
%#
%#  [Rc,Rep] = HoKa(x1,x2,Lr,MaxRep)
%#
%#  Input
%#      x1: Pattern Vectors for the first class
%#      x2: Pattern Vectors for the second class
%#      Lr: Learning rate
%#      MaxRep: Maximum repetitions
%#  Output
%#      Rc: Correct classification rate using the C-method
%#      Rep: Pattern vectors on each class
%#

%f1 = fopen( 'C:\Users\User\Desktop\matlab folder\lab5\output.txt', 'w' ) ;

NumOfP1 = columns(x1) ;
x1 = [x1;ones(1,NumOfP1)] ;
NumOfP2 = columns(x2) ;
x2 = [x2;ones(1,NumOfP2)] ;
Rep = [NumOfP1,NumOfP2] ;
TotPat = sum(Rep) ;
Rc = zeros(2,1) ;


z = [x1,-x2]'; 

Nv = columns(z) ;
Np = rows(z) ;
b = 0.1 * rand( Np, 1 ) ;
piz = inv( z' * z ) * z' ;
w = piz * b ;
b1 = z * w ; 
e = b1 - b ;
i = 0 ;
while( i < MaxRep )
  %fprintf(f1, 'Step %d\n', i ) ;
  %fprintf( f1,'Classification Score: %7.4f%%\n', ( 100 * NoGreatValMat( b1, 0.0 ) ) / ( rows(b1) * columns(b1)) ) ;
  if ( GreatValMat(b1,0.0) == 1 )
     %fprintf( f1,'Linear Separation of classes in %d repetitions\n', i ) ;
     Rc = Rep ;
     return ;
  end
  ea = AbsMat(e) ;
  b = b + Lr * ( e + ea ) ;
  w = piz * b ;
  b1 = z * w ;
  e = b1 - b ;
  i=i+1 ;
end
 %fprintf( f1,'Original Ho-Kasyap not convergence in %d repetitions\n', i ) ;
 %fprintf( f1,'Classification Score: %7.4f%%\n', ( 100 * NoGreatValMat( b1, 0.0 ) ) / ( rows(b1) * columns(b1)) ) ;
Rc(1) = NoGreatValMat( b1(1:NumOfP1), 0.0 )  ;
Rc(2) = NoGreatValMat( b1(NumOfP1+1:TotPat), 0.0 )  ;
