sentiment <- ts(project_data$sentiment, start=1968, end=2017)

#Plots of sentiment data
png("sentiment_tsplot.png", width = 800, height = 800)
plot(sentiment, main="US Consumer Sentiment")
abline(h=mean(sentiment), lty=2, lwd=2, col=2)
dev.off()

png("sentiment_P-ACF_tsplot.png", width=800, height=800)
par(mfrow=c(1,2))
acf(sentiment, main="ACF of US Consumer Sentiment")
pacf(sentiment, main="PACF of US Consumer Sentiment")
dev.off()





#Check differenced data

sentiment_diff <- diff(sentiment)

#Plots of sentiment differenced data
png("sentiment_diff_tsplot.png", width=800, height=800)
par(mfrow=c(1,1))
plot(sentiment_diff, main="1-Lag difference of US Consumer Sentiment")
abline(h = mean(sentiment_diff), lty=2, lwd=2, col=2)
dev.off()

png("sentiment_diff_P-ACF_tsplot.png", width=800, height=800)
par(mfrow=c(1,2))
acf(sentiment_diff, main="1-Lag difference of ACF of US Consumer Sentiment")
pacf(sentiment_diff, main="1-Lag difference of PACF of US Consumer Sentiment")
dev.off()
