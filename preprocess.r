library('jsonlite')
library('stm')

## There's still something weitd going on with the parsing, most likely around the titles..
data <- fromJSON( 'data_small.json', simplifyDataFrame=T )

summary( data )

## for initial version only like this
processed <- textProcessor(data$Abstract, metadata = data)
out <- prepDocuments(processed$documents, processed$vocab, processed$meta)

docs <- out$documents
vocab <- out$vocab
meta <-out$meta

out <- prepDocuments(processed$documents, processed$vocab, processed$meta, lower.thresh = 50)

save( out, docs, vocab, meta, file = 'processed.rdata' )
