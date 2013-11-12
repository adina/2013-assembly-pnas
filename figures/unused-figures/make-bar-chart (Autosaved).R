library(phyloseq)
library(plyr)
library(ggplot2)

setwd("~/Dropbox/2013-assembly-pnas/figures/")

library(reshape)
ref <- read.table("ref_genome.txt", sep="\t", row.names=1)
head(ref)
colnames(ref)=c("UFp","Fp","UFAp", "FAp")
ref$ref=rownames(ref)
ref <- melt(ref)
head(ref)
ref$ref <- factor(ref$ref, levels=c("NC_005008.1 (2412)",
"NC_005007.1 (549)",
"NC_005003.1 (533)",
"NC_005006.1 (253)",
"NC_005004.1 (112)",
"NC_009084.1 (85)",
"NC_005005.1 (74)",
"NC_000958.1 (71)",
"NC_000959.1 (52)",
"NC_009083.1 (48)",
"NC_001264.1 (40)",
"NC_001263.1 (32)",
"NC_004461.1 (30)",
"NC_009008.1 (29)",
"NC_010079.1 (29)",
"NC_007490.1 (27)",
"NC_009007.1 (24)",
"NC_007489.1 (18)",
"NC_004350.1 (16)",
"NC_007488.1 (13)",
"NC_007493.1 (13)",
"NC_007494.1 (13)",
"NC_009085.1 (11)",
"NC_009515.1 (9)",
"NC_009614.1 (7)",
"NC_000915.1 (6)",
"NC_003028.3 (6)",
"NC_000913.2 (6)",
"NC_006085.1 (6)",
"NC_003112.2 (4)"))
ref$variable <- factor(ref$variable, levels=c("UFp","Fp","UFAp","FAp"), labels=c("Unfiltered reads", "Normalized reads", "Unfiltered reassembly", "Normalized assembly"))
postscript("reference_coverage.eps", horizontal=TRUE)
p = ggplot(data=ref, aes_string(x="ref",y="value", fill="variable"))
p + theme_bw() + theme(panel.grid.major=element_blank()) + geom_bar(stat="identity", position="dodge")+theme(axis.text.x = element_text(angle=90, hjust=1, size=12), legend.position="bottom", axis.text.y = element_text(size=12))+xlab("")+ylab("Percentage aligned")+guides(fill=guide_legend(title=""))+scale_y_continuous(limits=c(0,1))+coord_flip()
dev.off()
