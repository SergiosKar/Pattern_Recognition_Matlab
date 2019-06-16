function [prError] = KMeansnew(Vector,c,KM,Threshold,Alphabet,numofcateg)
%#
%#  [Alphabet] = KMeans(Vectors,KM,Threshord)
%#
%#  Input
%#      Vector: Pattern Vectors
%#      KM: Size of the alphabet
%#      Threshold: Covergence threshold
%#  
%#      Alphabet: Vector alphabet 
%#

L = size(Vector) ;
N = L(1,1) ;
NumOfVect = columns(Vector) ;
if ( NumOfVect <= KM )
	printf( 'The size of the alphabet is greater than the number of the Vectors\n' ) ;
	return ;
end
Cluster = zeros(NumOfVect,1) ;

Error = 1.0E28 ;
prError = 1.0E30 ; 
while( (prError-Error)/Error > Threshold ) 
	prError = Error
	Error = 0.0 ;
	
	
	for i = 1:NumOfVect
        if (c(1,i)==numofcateg)
            for j = 1:KM
                Dist(j) = (Vector(:,i) - Alphabet(:,j))' * ( Vector(:,i) - Alphabet(:,j) ) ;
            end
            [Md,Rec] = min(Dist) ;
            Error = Error + Md ;
            Cluster(i) = Rec ;
        end
    end	
end