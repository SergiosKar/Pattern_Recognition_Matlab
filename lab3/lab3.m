%%  erothma 1
[x,c] = ReadIonosphere(351)


%% erothma 2
[x,c] = ReadIonosphere(351)
[Alphabet,Cluster,prError,Rep,Rec]=KMeanskathgories2(x,3,0,c,2)


%% erothma 4
[x,c] = ReadIonosphere(351)
[Alphabet] = KMeans(x,3,0)
[minpattern,pos,minDist]=kmin(x,c,3,Alphabet,2)

[prError] = KMeansnew(x,c,3,0,minpattern,1)