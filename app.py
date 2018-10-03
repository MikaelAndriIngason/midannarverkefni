#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from os import environ as env
from sys import argv

import bottle
import urllib.request, json
from bottle import run, route, static_file, error, request, default_app, get, response, template

with urllib.request.urlopen("https://apis.is/petrol") as url:
    apidata = json.loads(url.read().decode())

def minnstu_verd():
    verd95 = []
    verddi = []
    verd = []
    for y in apidata['results']:
        verd95.append([y['company'], y['bensin95']])
        verddi.append([y['company'], y['diesel']])
    verd95.sort(key=lambda x: x[1])
    verddi.sort(key=lambda x: x[1])
    verd.append([verd95[0], verddi[0]])
    return verd
def soluadilar():
    companies = []
    for x in apidata['results']:
        if x['company'] not in companies:
            companies.append(x['company'])
    return companies

@route("/")
def index():
    timi = apidata['timestampPriceCheck'].split('T')
    return template('index', data=minnstu_verd(), adili=soluadilar(), tim=timi)

@route('/soluadili/<adili>')
def static_skrar(adili):
    return template('soluadili', data=apidata, nafn=adili)

@route('/static/<skra:path>')
def static_skrar(skra):
    return static_file(skra, root='./public/')

@error(404)
def error404(error):
    return template('errorsida', errorn="404 síða fannst ekki")

bottle.run(host='0.0.0.0', port=argv[1])
