using StatsBase

sim402() = begin
   Colors=falses(7) 
   Colors[1]=true
   For I in sample(10:79,19,replace=false)
     Colors[div(I, 10)]=true
   End
   Sum(colours) 
End



