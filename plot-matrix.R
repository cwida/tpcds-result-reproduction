# this is a hack that automatically installs dependencies if not present
(function(lp) {
np <- lp[!(lp %in% installed.packages()[,"Package"])]
if(length(np)) install.packages(np,repos=c("https://cran.rstudio.com/"))
x <- lapply(lp,function(x){library(x,character.only=TRUE)}) 
})(c("ggplot2", "readr", "dplyr"))
# end hack

read <- function(name) {
	df <- readr::read_delim(sprintf("%s.tsv", name), delim="\t", col_names=c("query", "result", "group"))
	df$sys <- name
	df
}

all <- dplyr::bind_rows(list(read("monetdb"), read("postgres"), read("hyper"), read("sqlserver"), read("oracle"), read("sqlite")))

names(all) <- c("query", "result", "group", "sys")

pdf("matrix.pdf", height=10, width=6)
ggplot(all, aes(x=sys, y=query)) + geom_tile(aes(fill = result)) + theme( axis.title.x=element_blank()) + scale_fill_manual(values = c("diff" = "#ffffbf", "match" = "#99d594", "fail" = "#fc8d59"))
dev.off()
