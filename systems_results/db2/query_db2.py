import ibm_db_dbi as db
import sys

conn = db.connect("DATABASE=tpcds;HOSTNAME=localhost;PORT=50001;UID=db2inst1;PWD=db2inst1-pwd;", "", "")

if len(sys.argv) < 2:
	print("Usage: query_db2.py sqlfile")
	sys.exit(-1)

query = open(sys.argv[1], 'r').read().replace('\n', ' ').replace('SUBSTRING', 'SUBSTR')

cursor = conn.cursor()
cursor.execute(query)
for r in cursor.fetchall():
	print("\t".join([str(c) for c in r]))
