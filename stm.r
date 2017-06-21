library(stm)

load('processed.rdata')

model <- stm(
    documents = out$documents,
    vocab = out$vocab,
    K = 0,
    max.em.its = 75,
    data = out$meta,
    init.type = "Spectral"
)

summary( model )

save( model, file = 'model.rdata')
