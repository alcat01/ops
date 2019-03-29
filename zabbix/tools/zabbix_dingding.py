#!/usr/bin/python
# -*- coding: utf-8 -*-
import requests
import json
import sys
import os
  
headers = {'Content-Type': 'application/json;charset=utf-8'}
api_url = "https://oapi.dingtalk.com/robot/send?access_token=50c95385fcfb99572c23e832ecca839baf37d1a1b63fc32419bf6a036aa4fe34"
  
def msg(text):
    json_text= {
     "msgtype": "text",
        "at": {
            "atMobiles": [
                "15810448108"
            ],
            "isAtAll": False
        },
        "text": {
            "content": text
        }
    }
    print requests.post(api_url,json.dumps(json_text),headers=headers).content
      
if __name__ == '__main__':
    text = sys.argv[1]
    msg(text)
