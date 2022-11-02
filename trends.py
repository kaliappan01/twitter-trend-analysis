import json
import matplotlib.pyplot as plt
import re
with open("Twitter API v2.postman_collection.json") as f:
    trends = {}
    d = json.load(f)
    for i in d["item"]:
        for j in i["item"]:
            if "response" in j:
                for resp in j["response"]:
                    if "body" in resp:
                        hashtags = re.findall("#([a-zA-Z0-9]*)\s",resp["body"])
                        for hashtag in hashtags:
                            if hashtag in trends:
                                trends[hashtag]+=1
                            else:
                                trends[hashtag] = 1
    top5trends = sorted(trends.keys() , key=lambda item: trends[item],reverse=True)[:5]
    v = [trends[t] for t in top5trends]
    fig = plt.figure(figsize = (10, 5))
    plt.bar(top5trends, v)
    plt.show()
    
