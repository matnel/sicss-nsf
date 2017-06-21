import collections

import dateparser

import os

data = []
small = []

import random

for p in 'Part 1', 'Part 2', 'Part 3':

    for root, dirs, files in os.walk( p ):

        for name in files:

            if '.txt' in name:

                f = os.path.join(root, name)

                d = collections.defaultdict( str )

                key = ''

                for line in open( f ):

                    line = line.strip()

                    if ':' in line and key != 'Abstract':

                        key = line.split(':')[0].strip()

                        try:
                            d[ key ] = line.split(':')[1].strip().decode('utf-8')
                        except:
                            print 'UTF8 fail', f
                            print line.strip()

                    else:

                        try:
                            d[ key ] += ' ' + line.strip().decode('utf-8')
                        except:
                            print 'UTF8 fail', f
                            print line.strip()

                d['Date'] = str( dateparser.parse( d['Date'] ) )

                data.append( d )

                if random.random() < 0.01:
                    small.append( d )

import json

json.dump( data, open('data.json', 'w') )
json.dump( small, open('data_small.json', 'w') )
