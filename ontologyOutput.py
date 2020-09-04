import sys, sparql, re, types, itertools, json
from owlready2 import *

onto = get_ontology("file:///home/ufuoma/Documents/lmsontology").load()



#name = 'I am a boy'
#print (name)

name = str(sys.argv[1])
userName = eval('onto.' + name)

#print (username)

my_list = []

#print (json.dumps(name))

#print (userName.isSuitedTo)

for lo in userName.isSuitedTo:
    #print (lo)
    my_list.append(re.sub('lmsontology.','', str(lo)))

print (json.dumps(my_list))
