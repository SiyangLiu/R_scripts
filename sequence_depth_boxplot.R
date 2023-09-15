pdf("../20160928_DanishPanGenomeRebuttal/20160928_GenomeComparison/AverageDepth_raw.pdf",hei=6,wid=8)
data=read.table("../20160928_DanishPanGenomeRebuttal/20160928_GenomeComparison/FigureS1_assembly_statistics/20150119.depth_boxplot.input.xls.rawdata",
                   header=T)

rawdata=data[,-1]
names=c("180bp","500bp","800bp","2000bp","5000bp","100000bp","200000bp")
boxplot(rawdata,names=names,ylab="Average Depth")

dev.off()



pdf("../20160928_DanishPanGenomeRebuttal/20160928_GenomeComparison/AverageDepth_clean.pdf",hei=6,wid=8)
data=read.table("../20160928_DanishPanGenomeRebuttal/20160928_GenomeComparison/FigureS1_assembly_statistics/20150119.depth_boxplot.input.xls.cleandata",
                header=T)

rawdata=data[,-1]
names=c("180bp","500bp","800bp","2000bp","5000bp","100000bp","200000bp")
boxplot(rawdata,names=names,ylab="Average Depth")

dev.off()