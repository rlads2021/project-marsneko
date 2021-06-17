bartlett.test(sentiment_ptt$sentiment_value~sentiment_ptt$cata)
Ft<-aov(sentiment_ptt$sentiment_value~sentiment_ptt$cata,sentiment_ptt)
summary(Ft)
pairwise.t.test(sentiment_ptt$sentiment_value,sentiment_ptt$cata, p.adjust.method="bonferroni")
