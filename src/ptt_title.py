import requests,re
from bs4 import BeautifulSoup as bs
cookies={
"__cf_bm":"b061f4d11494eb98c01e49950891fa97dc746683-1620901046-1800-AauhlnO0M9nCanP6vCyG9DD1VZlcWfe1fBc7L0xv+BO6F/ISc3qfjbHCfZCXvkGUiVTFZhJEjHSYoLmDYsSy9vk",
"_ga":"GA1.2.197183732.1620494134",
"_gid":"GA1.2.986367917.1620886017",
'over18':1,
"__cfduid":"dda0debaa78515d636afe69ca1066d3871618801296"}
r = requests.Session()
payload ={
    "from":"/bbs/Gossiping/index.html",
    "yes":"yes"
}
f=open("ptt_data",'w')
temp="0/0"
r = requests.Session()
r1 = r.post("https://www.ptt.cc/ask/over18?from=%2Fbbs%2FGossiping%2Findex.html",payload)
for i in range(122,341):
    place="https://www.ptt.cc/bbs/Gossiping/index"+str(i)+".html"
    text=r.get(place)
    content=bs(text.text,features='html.parser')
    titles=content.find_all('div',attrs={'class':'title'})
    date=content.find_all('div',attrs={'class','date'})
    print(i)
    try:
        for k in range(len(titles)):
            """
            if str(date[k].text) == ' 1/01' and str(temp) == ' 12/31':
                j = j + 1
            temp = str(date[k].text)
            """
            f.writelines('"'+re.sub('"',"",re.sub(",","/",str(re.sub("\n","",titles[k].text))))+'",'+str(re.sub(" ","",date[k].text)+"\n"))
    except:
        print("errrrrrrrow")




