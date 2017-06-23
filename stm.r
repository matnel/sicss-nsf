library(stm)

load('processed.rdata')

model <- stm(
    documents = docs,
    vocab = vocab,
    K = 50, ## should be 0
    prevalence= ~ data.NSF_Org + s( data.Date ),
    max.em.its = 75,
    data = meta,
    init.type = "Spectral"
)

summary( model )

save( model, file = 'model.rdata')

prep <- estimateEffect(1:20 ~ data.NSF_Org + s( data.Date ), model, meta, uncertainty = "Global")

sink( file = "results.txt" )
summary( prep )
