library(ggplot2)
args <-commandArgs(T)
input = args[1]
output = args[2]
h <-read.table(input,header=T);
x <- h$BETA
y <- h$ckb_beta
GENE<-h$GENE
tit <- args[3]

dat.lm <- lm(y ~ x, data = h)
formula <- sprintf("italic(y) == %.2f*italic(x)+%.5f",
                     round(coef(dat.lm)[2],2),round(coef(dat.lm)[1],4))
r2 <- sprintf("italic(R^2) == %.3f",summary(dat.lm)$r.squared)
labels <- data.frame(formula=formula,r2=r2,stringsAsFactors = FALSE)

pdf(output,hei=8,wid=8)
ggplot(h,aes(x=x, y = y)) +
geom_point(aes(x=x, y = y), size = 4, colour = "darkred",shape=18) + 
#stat_smooth(aes(x=x, y = y),method=lm, se=FALSE,colour="red")+ 
scale_x_continuous(limits =c(-1.5,1.5))+
scale_y_continuous(limits =c(-1.5,1.5))+
geom_hline(aes(yintercept=0), colour="black", linetype="dashed")+
geom_vline(aes(xintercept=0), colour="black", linetype="dashed")+
#geom_text(x = -0.07, y = 0.1, label = lm_eqn(h), parse = TRUE,size=6)+
#geom_text(data=labels,mapping=aes(x = -0.1,y=0.1,label=formula),parse = TRUE,inherit.aes = FALSE,size = 8) +
#geom_text(data=labels,mapping=aes(x = -0.095,y=0.09,label=r2),parse = TRUE,inherit.aes = FALSE,size = 8) +
geom_abline(intercept=0,colour="blue",linetype="dashed")+
annotate("text", label = GENE, x = x, y = y, size = 2.5, colour = "#E64B35")+
labs(x="SNP effect size estiamted in UKBB study",y="SNP effect size estimated in CKB study")+
ggtitle(tit)+
theme(title=element_text(size=20))+
theme(plot.title = element_text(hjust = 0.5))
dev.off()

