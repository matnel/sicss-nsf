library('jsonlite')
library('stm')

## There's still something weitd going on with the parsing, most likely around the titles..
## therefore, limit dataset
data <- fromJSON( 'data_small.json', simplifyDataFrame=T )

metadata <- data.frame( data$Date, data$NSF_Org )
metadata$data.Date <- as.Date( metadata$data.Date )
metadata$data.NSF_Org <- as.factor( metadata$data.NSF_Org )


## for initial version only like this, change to the fancier one later on
processed <- textProcessor( data$Abstract_cleaned, metadata )
out <- prepDocuments(processed$documents, processed$vocab, processed$meta)

docs <- out$documents
vocab <- out$vocab
meta <-out$meta

save( out, docs, vocab, meta, file = 'processed.rdata' )
