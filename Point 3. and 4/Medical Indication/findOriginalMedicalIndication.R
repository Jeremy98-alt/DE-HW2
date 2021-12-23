options(stringsAsFactors = F)

setwd("C:/Users/Jeremy/Desktop/DE-HW2/Practical Session - Second Type (SAVERUNNER)/code/MEDICAL INDICATION")

known <- read.table("TTD_association.txt", sep = "\t", header = T, check.names = F, quote = "")
colnames(known) <- c("TTD_association","drug")

#TTD_association <- aggregate(data = known, TTD_association ~ drug, paste, collapse = ";")

predicted <- read.table("Drug_Disease_network_pval0.05.txt", header = T, quote ="", check.names = F, sep = "\t")

df <- merge(known, predicted, by = "drug", all = F)
df <- df[,c("drug", "proximity", "pval", "similarity", "adjusted_similarity","TTD_association")]

write.table(df, "onLabel_Arthritis_Rheumatoid_drug.txt", row.names = F, col.names = T, sep = "\t", quote = F)


# Performance Evaluation -------------------------------------------------

onLabel <- read.table("onLabel_Arthritis_Rheumatoid_drug.txt", sep = "\t", header = T, check.names = F, quote = "")
onLabel <- onLabel[, c("drug", "TTD_association")]
offLabel <- read.table("Drug_Disease_network.txt", sep = "\t", header = T, check.names = F, quote = "")
offLabel <- offLabel[, c("disease", "drug")]
