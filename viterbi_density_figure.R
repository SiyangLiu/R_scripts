#density plot
name="pct_viterbi1 density plot"
v1=read.table("../20160920_BSACourse/week4/pct_viterbi1.txt")
plot (density(v1[,1],adjust=0.1),col= "red",ylim=c(0,0.15),xlim=c(0,150),main=name,xlab="Percentage Correct (%)")
#lines(density(f1[,1]),col= "green",ylim=c(0,0.15),xlim=c(0,150))
