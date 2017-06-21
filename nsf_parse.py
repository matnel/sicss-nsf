import collections

import dateparser

import os

data = []

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

                        d[ key ] = line.split(':')[1].strip()

                    else:

                        d[ key ] += ' ' + line.strip()

                d['Date'] = dateparser.parse( d['Date'] )

                data += d
import json

json.dump( data, open('data.json', 'w') )
