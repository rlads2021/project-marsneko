import csv,os
from snownlp import SnowNLP,sentiment

csvfile=open('./ptt_20202021_daily.csv', newline='')
rows=csv.DictReader(csvfile)
data=[]
for i in rows:
     data.append(i)

x=0
for i in data:
     x=x+1
     lis=i['titles'].split()
     soc=0
     for j in lis:
          snow=SnowNLP(j)
          soc=soc+snow.sentiments
     i['sentiment_value']=(soc/len(lis))
     print(x/len(data))
     print((soc/len(lis)))
with open('sentiment_ptt.csv',"w",newline='') as csvfile:
     tname=['','time','cata','titles','freq','sentiment_value']
     writer = csv.DictWriter(csvfile, fieldnames=tname)
     writer.writeheader()
     for i in data:
          writer.writerow(i)