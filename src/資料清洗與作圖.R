
mutate(ptt_2014to2021_year,year=year(time),month=month(time))->tt
mutate(tt,ym=paste(year,month,"1",sep="-"))->tt
tt%>%group_by(ym)%>%summarise(freq=n())->tt
>

ptt_2014to2021_year%>%filter(cata %in% c("問卦","新聞","爆卦"))%>%group_by(year(time))%>%summarise(n())->tt
mutate(tt,y_m=paste(year,month,sep="-"))->tt
mutate(tt,y_m=paste(year,month,"1",sep="-"))->tt
tt$y_m<-as.Date(tt$y_m)
ggplot(data=tt)+
  geom_point(aes(x=y_m,y=freq))


select(ptt_2021_year,time,cata,title)->dt
filter(dt,cata %in% c("問卦","爆卦","新聞"))->dt
filter(dt,as.Date(time)>as.Date("2020-03-31") & as.Date(time)<as.Date("2021-06-01"))->dt
dt%>%group_by(time,cata)%>%summarise(titles=paste(title,collapse = " "),freq=n())->testTable


ggplot(data=sentiment_ptt)+
geom_point(mapping = aes(x=sentiment_value,y=freq,color=cata))+
geom_smooth(method = "lm",mapping = aes(x=sentiment_value,y=freq,color=cata))

ggplot(data=sentiment_ptt,mapping = aes(x=time,y=sentiment_value,color=cata))+
+ geom_line()

entiment_ptt->ttt
ttt$cata<-NULL
head(ttt)
select(ttt,time,freq,sentiment_value)->ttt


ttt$z_valueofx<-scale(ttt$sentiment_value)[,1]
ttt$z_valueofy<-scale(ttt$freq)[,1]

model_2<-lm(z_valueofy~z_valueofx,data = ttt)
summary(model_2)

ttt%>%group_by(time)%>%summarise(freq=sum(freq),sentiment=mean(sentiment_value))->nocata_value
model_3=lm(freq~time,data = nocata_value)
summary(model_3)

ggplot(data=nocata_value,aes(sentiment,freq))+
  + geom_point()+
  + geom_smooth(method = "lm")

model_4<-lm(z_valueofy~z_valueofx,data = nocata_value)
summary(nocata_value)

ggplot(data = nocata_value,aes(z_valueofx,z_valueofy))+
  + geom_point()
