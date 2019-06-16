function [minpattern,pos,minDist]=kmin(x,c,KM,Alphabet,numofcateg)
%epistrefei min paradeigmata
L = size(x) ;
N = L(1,1) ;
NumOfVect = columns(x) ;
posmin=zeros(KM,1); %thesh minimum
minpattern=zeros(34,KM);
pos=zeros(KM,1);
s=0;
i=1;  j=1;
while(s<3)
    if (c(1,i)==numofcateg)
        minpattern(:,j)=x(:,i);% ta 3 prwta ws min
        minDist(j) = (minpattern(:,j) - Alphabet(:,j))' * (minpattern(:,j) - Alphabet(:,j) ) ;
        % apostaseis tous apo ta eikonika
        s=s+1;
        j=j+1;
        posmin(s,1)=i;
    end
    i=i+1;
    
end



    for i = 1:NumOfVect
       if (c(1,i)==numofcateg)
        for j = 1:KM
            Dist(j) = (x(:,i) - Alphabet(:,j))' * (x(:,i) - Alphabet(:,j) ) ;
        end
        [Md,Rec] = min(Dist) ;% Rec thesh tou min(Dist)
        if(Md<minDist(Rec)) %
           minDist(Rec)=Md;
           minpattern(:,Rec)=x(:,i);
           pos(Rec,1)=i
        end
    end
    end

    