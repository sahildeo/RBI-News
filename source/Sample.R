library(RTextTools)

data(USCongress)

doc_matrix<-create_matrix(USCongress$text,language = "english", removeNumbers = TRUE, stemWords = TRUE
                          , removeSparseTerms = .998)

container<-create_container(doc_matrix, USCongress$major, trainSize = 1:4000, testSize = 4001:4449, virgin = F)

RF<-train_model(container, "RF")

RF_CLASSIFY<-classify_model(container, RF)

analytics<-create_analytics(container, RF_CLASSIFY)

summary(analytics)

write.table(a,"DocumentSummary.csv",sep = ",")
