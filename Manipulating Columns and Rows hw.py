import pandas as pd

FakeNews = pd.read_excel('C:/Users/olver/Downloads/FakeNews.xlsx')

FakeNews['StoryType'] = "Fake"

FakeNews.drop(['when'], axis=1, inplace=True)

FakeNews1 = FakeNews['url'].str.split('_', expand=True).rename(columns = lambda x: "URL"+str(x+1))

FakeNews2 = pd.concat([FakeNews, FakeNews1], axis=1)

FakeNews2.drop(['url'], axis=1, inplace=True)

FakeNews2['url'] = FakeNews2["URL1"] + "_" + FakeNews2["URL2"].map(str)

FakeNews2.drop(['URL1', 'URL2'], axis=1, inplace=True)

FakeNews3 = FakeNews2[:10]
