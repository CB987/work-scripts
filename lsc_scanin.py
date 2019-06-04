#!/usr/bin/env python

import socks
import socket
import requests
import xml.etree.ElementTree as ET

api_key = [api_key]

socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, "127.0.0.1", 8080)
socket.socket = socks.socksocket

#barcodes = ("/alma/bin/clare_barcodes.txt")
#barcodeFile = open(barcodes, "r")
#for line in barcodeFile:
#    line = line.replace("\n", "")

#line = '000014046842'
def lsc_scanin(line):
    barcode = line

    print(barcode)
# send a get using the item barcode to get the rest of the item info 
    payload = { 'item_barcode' : barcode, 'apikey' : api_key}

    r = requests.get('https://api-na.hosted.exlibrisgroup.com/almaws/v1/items?', params=payload)

# get the mms_id, holding_id, and item_pid out with elementTree
    root = ET.fromstring(r.text)

#feed them to the request payload
    mmsid = root[0][0].text
    holdingid = root[1][0].text
    pid = root[2][0].text

    payload2 = {'op' : 'scan', 'library' : 'LSC', 'circ_desk' : 'DEFAULT_CIRC_DESK', 'apikey' : api_key}

# send a post to the scan-in url

    r2 = requests.post('https://api-na.hosted.exlibrisgroup.com/almaws/v1/bibs/' + mmsid + '/holdings/' + holdingid + '/items/' + pid + '?', params=payload2)

    root2 = ET.fromstring(r2.text)
    print(r2.status_code)
    print(root2[2][4].attrib)

# for each barcode in incoming list, call the scanin function
barcodes = ("/alma/bin/clare_barcodes.txt")
barcodeFile = open(barcodes, "r")
for line in barcodeFile:
    line = line.replace("\n", "")
    lsc_scanin(line)
