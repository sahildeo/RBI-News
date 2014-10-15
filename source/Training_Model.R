library(tm)
library(RTextTools)

data <- read.csv("/Users/sahildeo/Documents/college/PhD/Output/Dataset - News/dataset_news_2.csv",header=TRUE)

doc_matrix<-create_matrix(data$title,language = "english", removeNumbers = TRUE, stemWords = TRUE
                          , removeSparseTerms = .998)


container<-create_container(doc_matrix, data$code, trainSize = 1:1000, testSize = 1001:1500, virgin = F)

RF<-train_model(container, "RF")
SLDA<-train_model(container, "SLDA")

RF_CLASSIFY<-classify_model(container, RF)
SLDA_CLASSIFY<-classify_model(container, SLDA)

analytics<-create_analytics(container, cbind(RF_CLASSIFY,SLDA_CLASSIFY))

summary(analytics)

write.table(analytics@document_summary,"DocumentSummary_RF.csv",sep = ",")


