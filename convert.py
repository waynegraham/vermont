import glob
import sys
import xml.etree.cElementTree as ET

RECORDS_PATTERN = "./PT*.xml"

records = ET.Element("records")

# Loop over every XML file that starts with 'PT'
for f in glob.iglob(RECORDS_PATTERN):
    doc = ET.parse(f) # parse the file with ElementTree
    records.extend(doc.getroot().iter('formHeader'))

ET.ElementTree(records).write('records.xml')

